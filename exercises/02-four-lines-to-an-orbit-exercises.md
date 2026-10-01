<!-- Parked exercises for 02-four-lines-to-an-orbit.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch2-zero-g}
Build the Earth-Moon system with `create_system(G = 0)` and plot it. Explain the result in one sentence.
:::

::: {#exr-ch2-speed}
Run the Moon simulation three times with the Moon's initial speed at 1,000, 1,022, and 1,044 m/s. Plot the Moon's distance from the origin against time for each run on one axis. Which run has the largest swing between nearest and farthest distance? Before you run it, predict whether the orbit will be larger or smaller than the circle in each case.
:::

::: {#exr-ch2-com}
In the four-line version, the center of mass drifts at $v_{\mathrm{com}} = m_{\mathrm{Moon}} v_{\mathrm{Moon}} / (m_{\mathrm{Earth}} + m_{\mathrm{Moon}})$. Compute the center-of-mass position at every time step from the simulation tibble (mass-weighted mean of $x$ and $y$, grouped by `time`) and plot its $y$ coordinate against time. Confirm it is a straight line with the predicted slope.
:::

::: {#exr-ch2-step}
Re-run the inner solar system with `time_step = seconds_per_day * 5`. Does Mercury's orbit still look right? Try 10 days. At what step size does it visibly fall apart, and does Mars fall apart at the same step size?
:::
