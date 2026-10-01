# Analysis helpers used throughout the book.
# Each is introduced and explained in the chapter named in its comment;
# this file lets later chapters use them without repeating the definitions.
# (_common.R sources this file.) Everything the book needs beyond these is
# an orbitr 1.0.0 function: get_orbital_elements(), get_energy(),
# get_momentum(), get_angular_momentum(), conserved_quantities(),
# continue_simulation(), system_from_simulation(), and
# shift_reference_frame(sim, "barycenter").

# ---- Chapter 4: relative motion, eccentricity, period --------------------

relative_state <- function(sim, body, center, G = gravitational_constant) {
  ctr <- sim |>
    dplyr::filter(id == center) |>
    dplyr::select(time, m_c = mass, x_c = x, y_c = y, z_c = z,
                  vx_c = vx, vy_c = vy, vz_c = vz)
  sim |>
    dplyr::filter(id == body) |>
    dplyr::inner_join(ctr, by = "time") |>
    dplyr::mutate(mu = G * (mass + m_c),
                  rx = x - x_c,   ry = y - y_c,   rz = z - z_c,
                  ux = vx - vx_c, uy = vy - vy_c, uz = vz - vz_c) |>
    dplyr::select(time, mu, rx, ry, rz, ux, uy, uz)
}

eccentricity <- function(sim, body, center, G = gravitational_constant) {
  relative_state(sim, body, center, G) |>
    dplyr::mutate(r  = sqrt(rx^2 + ry^2 + rz^2),
                  hx = ry * uz - rz * uy,
                  hy = rz * ux - rx * uz,
                  hz = rx * uy - ry * ux,
                  ex = (uy * hz - uz * hy) / mu - rx / r,
                  ey = (uz * hx - ux * hz) / mu - ry / r,
                  ez = (ux * hy - uy * hx) / mu - rz / r,
                  e  = sqrt(ex^2 + ey^2 + ez^2)) |>
    dplyr::select(time, e, ex, ey, ez)
}

measure_period <- function(sim, body, center = NULL, G = gravitational_constant) {
  if (is.null(center)) {
    # Measure about the origin of whatever frame `sim` is in (e.g. after
    # shift_reference_frame(sim, "barycenter")).
    rel <- sim |>
      dplyr::filter(id == body) |>
      dplyr::transmute(time, rx = x, ry = y)
  } else {
    rel <- relative_state(sim, body, center, G)
  }
  theta  <- atan2(rel$ry, rel$rx)
  dtheta <- ((diff(theta) + pi) %% (2 * pi)) - pi
  swept  <- abs(cumsum(c(0, dtheta)))
  i <- which(swept >= 2 * pi)[1]
  if (is.na(i)) return(NA_real_)
  f <- (2 * pi - swept[i - 1]) / (swept[i] - swept[i - 1])
  rel$time[i - 1] + f * (rel$time[i] - rel$time[i - 1])
}

# ---- Chapter 7: orbital elements <-> state vectors -----------------------

rot_x <- function(theta) {
  co <- cos(theta); si <- sin(theta)
  matrix(c(1, 0, 0,   0, co, si,   0, -si, co), nrow = 3)
}
rot_z <- function(theta) {
  co <- cos(theta); si <- sin(theta)
  matrix(c(co, si, 0,   -si, co, 0,   0, 0, 1), nrow = 3)
}

keplerian_to_state <- function(a, e = 0, i = 0, lan = 0, arg_pe = 0,
                               nu = 0, mu) {
  rad <- pi / 180
  i <- i * rad; lan <- lan * rad; w <- arg_pe * rad; nu <- nu * rad
  p <- a * (1 - e^2)
  h <- sqrt(mu * p)
  r <- p / (1 + e * cos(nu))
  r_pf <- c(r * cos(nu), r * sin(nu), 0)
  v_pf <- c(-mu / h * sin(nu), mu / h * (e + cos(nu)), 0)
  Q <- rot_z(lan) %*% rot_x(i) %*% rot_z(w)
  r_in <- as.vector(Q %*% r_pf)
  v_in <- as.vector(Q %*% v_pf)
  dplyr::tibble(x = r_in[1], y = r_in[2], z = r_in[3],
                vx = v_in[1], vy = v_in[2], vz = v_in[3])
}

state_to_elements <- function(x, y, z, vx, vy, vz, mu) {
  cross <- function(a, b) c(a[2] * b[3] - a[3] * b[2],
                            a[3] * b[1] - a[1] * b[3],
                            a[1] * b[2] - a[2] * b[1])
  norm  <- function(a) sqrt(sum(a^2))
  deg   <- function(theta) (theta * 180 / pi) %% 360
  r <- c(x, y, z); v <- c(vx, vy, vz)
  h <- cross(r, v)
  n <- cross(c(0, 0, 1), h)
  e_vec <- cross(v, h) / mu - r / norm(r)
  e <- norm(e_vec)
  a <- 1 / (2 / norm(r) - sum(v^2) / mu)
  i <- acos(h[3] / norm(h))
  if (norm(n) < 1e-12 * norm(h)) n <- c(1, 0, 0)
  e_dir <- if (e > 1e-12) e_vec / e else n / norm(n)
  h_hat <- h / norm(h)
  lan    <- atan2(n[2], n[1])
  arg_pe <- atan2(sum(cross(n, e_dir) * h_hat), sum(n * e_dir))
  nu     <- atan2(sum(cross(e_dir, r) * h_hat), sum(e_dir * r))
  dplyr::tibble(a = a, e = e, i = deg(i), lan = deg(lan),
                arg_pe = deg(arg_pe), nu = deg(nu))
}

solve_kepler <- function(M, e, tol = 1e-12) {
  E <- if (e < 0.8) M else pi
  repeat {
    dE <- (E - e * sin(E) - M) / (1 - e * cos(E))
    E  <- E - dE
    if (abs(dE) < tol) break
  }
  E
}

true_anomaly_at <- function(t_since_periapsis, a, e, mu) {
  M  <- sqrt(mu / a^3) * t_since_periapsis
  E  <- solve_kepler(M %% (2 * pi), e)
  nu <- 2 * atan2(sqrt(1 + e) * sin(E / 2), sqrt(1 - e) * cos(E / 2))
  (nu * 180 / pi) %% 360
}

# Unwrap a sequence of angles so it grows continuously past +/- pi.
unwrap <- function(theta) {
  cumsum(c(theta[1], ((diff(theta) + pi) %% (2 * pi)) - pi))
}

# Time since periapsis at true anomaly nu (degrees), for an ellipse.
time_since_periapsis <- function(nu_deg, a, e, mu) {
  nu <- nu_deg * pi / 180
  E  <- 2 * atan2(sqrt(1 - e) * sin(nu / 2), sqrt(1 + e) * cos(nu / 2))
  M  <- E - e * sin(E)
  (M %% (2 * pi)) / sqrt(mu / a^3)
}
