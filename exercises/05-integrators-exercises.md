<!-- Parked exercises for 05-integrators.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch5-equivalence}
Starting from the velocity Verlet update @eq-verlet, write the position update for step $n$ and for step $n-1$, subtract them, and use the velocity update to eliminate $\mathbf{v}_n - \mathbf{v}_{n-1}$. Show that the result is the Störmer form @eq-stormer.
:::

::: {#exr-ch5-vv-det}
Multiply out $\det M_{\mathrm{VV}}$ in @eq-vv-matrix and confirm it equals 1. Then compute the trace, and show the eigenvalues have modulus 1 exactly when $\omega\Delta t < 2$.
:::

::: {#exr-ch5-cromer-phase}
Run `star_planet` for ten years with Euler-Cromer and with Verlet at a six-hour step. For each, find the time of the fifth periapsis passage (the fifth local minimum of the planet's distance from the star). By how many days do they differ? Which do you trust, and why?
:::

::: {#exr-ch5-moon-step}
The default time step is one hour. Simulate the Earth-Moon system for one year with steps of 1, 3, 6, and 12 hours, compute the maximum relative energy error for each, and check that it scales as expected for a second-order method.
:::

::: {#exr-ch5-euler-escape}
Using the Euler run, estimate from the energy plot how long it would take the planet to reach zero total energy and escape. Then run it that long and see if you were right.
:::
