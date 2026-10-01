<!-- Parked exercises for 15-the-cpp-engine.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch15-halve}
Modify the kernel (or Chapter 3's R version) to loop over $j < k$ only, applying each pair's force to both bodies with opposite signs. Confirm it gives the same accelerations, and time it against the original for $n = 200$.
:::

::: {#exr-ch15-record}
Run a two-body system for one year with hourly steps, then again with daily steps, and compare the elapsed times. By what factor does the cost change, and what does that say about where the time goes?
:::

::: {#exr-ch15-energy-cost}
`get_energy()` is also $O(n^2)$ per time step: its potential-energy sum uses the same `outer()` matrices as the R fallback. Time it on the 200-body run and compare with the simulation itself. Which is more expensive, and why?
:::

::: {#exr-ch15-verlet-cost}
`simulate_system()` evaluates the acceleration twice per Verlet step, but $\mathbf{a}_{n+1}$ of one step is $\mathbf{a}_n$ of the next. Sketch how the loop would change to reuse it, and estimate from the benchmark how much time it would save for $n = 10$ and for $n = 200$.
:::
