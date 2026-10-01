<!-- Parked exercises for 16-limits-and-extensions.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch16-merge}
Using `closest_approach()`, find the first time two stars of the chaotic triple pass within two solar radii. Stop the run there, replace the two with their inelastic merger, continue with `continue_simulation()`, and compare the subsequent motion with the unmerged run.
:::

::: {#exr-ch16-beta}
Derive $e = \beta/(1-\beta)$ from Chapter 4's rule $e = |k^2-1|$, and confirm with `get_orbital_elements()` on the $\beta = 0.3$ grain (pass `mu = gravitational_constant * (1 - 0.3) * mass_sun`, the effective parameter).
:::

::: {#exr-ch16-hohmann}
A Hohmann transfer from a circular orbit of radius $r_1$ to one of radius $r_2$ uses an ellipse with $a = (r_1+r_2)/2$. Use vis-viva to compute the two $\Delta v$'s for a transfer from a 400 km Earth orbit to geostationary altitude (42,164 km from Earth's center). Apply them with `kick_drag()`-style velocity edits and `continue_simulation()`, and confirm the satellite arrives on a circular orbit.
:::

::: {#exr-ch16-real-drag}
Replace the uniform kick in `kick_drag()` with one whose damping time depends on altitude as $\tau(r) = \tau_0\exp\big((r - r_0)/H\big)$, with a scale height $H$ of 60 km, and apply it every ten minutes instead of every day (use a shorter run). Show that periapsis stays nearly fixed while apoapsis falls.
:::

::: {#exr-ch16-sun-sync}
Use @eq-j2-rates to find the inclination at which a circular 700 km orbit is Sun-synchronous ($\dot\Omega = 360°$ per year). Why must it be retrograde?
:::

::: {#exr-ch16-yoshida}
Implement the fourth-order Yoshida composition in plain R on top of Chapter 3's `accelerations()` for a two-body system, and show that its energy error scales as $\Delta t^4$ by halving the step twice.
:::
