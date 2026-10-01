<!-- Parked exercises for 08-the-solar-system.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch8-venus}
Compute the Earth-Venus synodic period from @eq-synodic and from the data. It should be close to 584 days. How many synodic periods make almost exactly eight years? (This near-commensurability is why Venus's appearances in the sky repeat on an eight-year cycle, known since the Babylonians.)
:::

::: {#exr-ch8-moon}
Build the Earth-Moon system with `add_planet("Moon", parent = "Earth")` and an hourly step, measure the Moon's period, and weigh Earth with Kepler's third law. How does the answer compare with `mass_earth`, and why is it slightly off? (Chapter 7 is relevant.)
:::

::: {#exr-ch8-pluto}
Pluto and Neptune are in a 3:2 orbital resonance: Pluto completes two orbits for every three of Neptune. Run a 500-year simulation with Pluto included (a daily step is fine) and measure both periods. Is the ratio 3:2? Pluto's orbit crosses Neptune's; use the data to show that the two bodies are never close when it does.
:::

::: {#exr-ch8-saturn}
Remove Jupiter from the system and repeat the Sun-wobble plot. Identify Saturn's period and velocity amplitude from the result and compare with the two-body prediction $v = \sqrt{G m_{\mathrm{Saturn}}^2 / ((M_\odot + m_{\mathrm{Saturn}})\, a)}$.
:::

::: {#exr-ch8-mercury}
Mercury's perihelion precesses by about 532 arcseconds per century because of the other planets (plus 43 from general relativity, which the package does not include). Extract Mercury's osculating argument of perihelion from the full run, average it over each orbit to smooth out the short-period wobble, and estimate the precession rate. How close do you get, and what limits the precision?
:::
