<!-- Parked exercises for 04-the-two-body-problem.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch4-energy-a}
Carry out the algebra from @eq-e-energy to @eq-energy-a: substitute $h^2 = \mu a (1-e^2)$ and solve for $\varepsilon$. Where did the assumption $e \ne 1$ get used?
:::

::: {#exr-ch4-escape}
Launch the planet in `make_sim()` at $k = 0.99\sqrt{2}$, $k = \sqrt{2}$, and $k = 1.1\sqrt{2}$ for two years. Compute the specific energy $\varepsilon$ from the simulated state at every time step and plot it against time for all three. What sign does each have, and is it constant?
:::

::: {#exr-ch4-perihelion-speed}
Mars has $a = 2.279\times10^{11}$ m and $e = 0.0934$. Use vis-viva to compute its speed at perihelion and at aphelion. Then build Mars with `add_planet("Mars", parent = "Sun")` (which starts it at perihelion), simulate for one Mars year, and compare the maximum and minimum speeds in the output with your numbers.
:::

::: {#exr-ch4-weigh}
Io orbits Jupiter with a period of 1.769 days at a mean distance of 421,800 km. Use Kepler's third law to compute Jupiter's mass and compare with `mass_jupiter`. Then simulate Io on a circular orbit using your computed mass and check that `measure_period()` returns 1.769 days.
:::

::: {#exr-ch4-e-vector-direction}
For the $k = 1.2$ run, print the components of $\mathbf{e}$ at $t = 0$. In which direction does it point, and why is that the direction you should expect given where the planet was launched?
:::
