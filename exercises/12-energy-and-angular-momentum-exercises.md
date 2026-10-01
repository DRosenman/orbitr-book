<!-- Parked exercises for 12-energy-and-angular-momentum.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch12-euler-L}
Show that one Euler step changes the total angular momentum by $\Delta t^2\sum_j m_j\mathbf{v}_j\times\mathbf{a}_j$, and that for a circular two-body orbit this quantity is nonzero and has a constant sign. Confirm with the Euler run that $|\mathbf{L}|$ grows monotonically.
:::

::: {#exr-ch12-softening}
Run Chapter 6's softened encounter and compute `conserved_quantities()` with its default and with `softening = 0`. Describe the spurious "drift" the mismatched version shows.
:::

::: {#exr-ch12-precession-e}
Repeat the numerical-precession measurement for a planet on a circular orbit ($e = 0$) and on a very eccentric one ($e = 0.8$) with the same semi-major axis and step. How does the artifact depend on eccentricity, and why?
:::

::: {#exr-ch12-euler-cromer-precession}
Repeat it with Euler-Cromer at a one-day step. Is the numerical precession larger or smaller than Verlet's at the same step, and how does it scale when the step is halved?
:::

::: {#exr-ch12-full}
Write a function `check_run(sim)` that prints one line per conservation law saying "ok" or "suspect", using thresholds you choose from the figures in this chapter, and run it on every simulation in Chapter 8.
:::
