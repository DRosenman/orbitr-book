<!-- Parked exercises for 13-comets.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch13-two-orbits}
Extend the segmented Halley run to two full orbits by adding three more segments, and compare the time of the second perihelion with Kepler's third law.
:::

::: {#exr-ch13-switch-radius}
Repeat the segmented run switching at 2 AU and at 10 AU instead of 5 AU. Tabulate the number of steps and the maximum energy error for each. Where is the sweet spot?
:::

::: {#exr-ch13-loop}
Write a function `run_segmented(system, body, center, r_switch, step_far, step_near, duration)` that runs in chunks of one year with the coarse step (using `continue_simulation()`), checks after each chunk whether the body is inside `r_switch`, and switches steps accordingly, without using Kepler's equation at all. Test it on Halley.
:::

::: {#exr-ch13-borisov}
Comet 2I/Borisov, the second interstellar visitor, had $e = 3.36$ and $q = 2.01$ AU. Set it up, run it through perihelion, and compute its deflection angle and its speed at infinity.
:::

::: {#exr-ch13-sungrazer}
Build a Kreutz-like comet with $q = 0.005$ AU and $e = 0.9999$, start it at 2 AU inbound, and find the time step at which Verlet resolves the perihelion passage (energy error below $10^{-4}$). How many steps per day is that?
:::
