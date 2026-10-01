<!-- Parked exercises for 06-softening.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch6-period}
Simulate the Earth-Sun system for one year with `softening` equal to $10^8$, $10^9$, and $10^{10}$ m and measure the period each time with `measure_period()`. Compare the fractional change with the prediction $\tfrac34(\varepsilon/r)^2$.
:::

::: {#exr-ch6-max-force}
Differentiate the softened acceleration $a(r) = Gm\,r/(r^2+\varepsilon^2)^{3/2}$ with respect to $r$ and show that its maximum is at $r = \varepsilon/\sqrt2$ with value $(2/3)^{3/2}\,Gm/(\sqrt{2}\,\varepsilon^2) \approx 0.385\,Gm/\varepsilon^2$.
:::

::: {#exr-ch6-step}
For the unsoftened encounter, run with steps of 320, 160, 80, 40, and 20 seconds and tabulate the eccentricity after the encounter and the maximum energy error. At what step does the answer stop changing?
:::

::: {#exr-ch6-potential}
Show that the potential energy of two bodies interacting through the softened force is $-Gm_1m_2/\sqrt{r^2+\varepsilon^2}$ by integrating the force from $r$ to infinity. Then confirm that `conserved_quantities(soft)` reports a nearly constant energy while `conserved_quantities(soft, softening = 0)` does not.
:::
