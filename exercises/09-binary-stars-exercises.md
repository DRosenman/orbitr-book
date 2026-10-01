<!-- Parked exercises for 09-binary-stars.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch9-equal}
Build an equal-mass binary of two Sun-mass stars 1 AU apart. Before running it, predict each star's speed and the period. Then confirm both.
:::

::: {#exr-ch9-wobble}
Plot Kepler-16b's distance from the barycenter against time for the two-year run. Identify the period of the wobble and explain why it matches the binary's period rather than the planet's.
:::

::: {#exr-ch9-sunset}
From the planet, how far apart in the sky are the two stars? Shift the Kepler-16 run to the planet's frame with `shift_reference_frame("Kepler-16b")`, compute the angle between the directions to the two stars at every time step, and plot it. What is the maximum separation in degrees? (Chapter 10 does more with this.)
:::

::: {#exr-ch9-retrograde}
Put the test planet at $2.0\,a_{\mathrm{bin}}$ but give it a *retrograde* orbit (reverse the sign of its velocity). Retrograde circumbinary orbits are known to be more stable than prograde ones. Does it survive fifteen years?
:::

::: {#exr-ch9-mass-ratio}
Repeat the stability sweep with $m_B = m_A$ (so $q = 0.5$) and a circular binary. Where is the transition now, and what does @eq-holman-wiegert predict?
:::
