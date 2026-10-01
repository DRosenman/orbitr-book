<!-- Parked exercises for 11-chaos-and-the-three-body-problem.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch11-lyapunov-step}
Repeat the twin-run experiment with a time step of 30 minutes instead of an hour. Does the Lyapunov time change? Does the detailed trajectory after two years change? What does that tell you about which results of a chaotic simulation to trust?
:::

::: {#exr-ch11-energy-check}
Run `get_energy()` on the three-year triple and confirm the total is conserved through the ejection. Then compute the energy of the surviving pair alone (as a two-body system) at the end and show that it is more negative than the total.
:::

::: {#exr-ch11-figure-eight}
The figure-eight orbit is a periodic solution of the equal-mass three-body problem in which all three bodies chase each other around a single figure-eight curve. In units with $G = 1$ and unit masses, its initial conditions are bodies at $(0.97000436, -0.24308753)$, $(-0.97000436, 0.24308753)$, and $(0, 0)$ with velocities $(0.46620369, 0.43236573)$, $(0.46620369, 0.43236573)$, and $(-0.93240737, -0.86473146)$. Scale these to SI units (choose a mass and a length; derive the time and velocity scales) and reproduce the orbit with `create_system(G = ...)`. How long does it stay on the figure eight?
:::

::: {#exr-ch11-retrograde-hill}
Place a test moon at $0.7\,r_{\mathrm{H}}$ on a *retrograde* orbit (reverse the sign of its velocity relative to Earth) and another at the same distance prograde. Which survives five years?
:::

::: {#exr-ch11-l2}
Repeat the $L_1$ experiment at $L_2$, on the far side of Earth from the Sun, where JWST operates. Is the e-folding time the same? Then try $L_3$, and explain why its instability is so much slower.
:::
