<!-- Parked exercises for 07-keplerian-elements.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch7-hodograph}
Show from @eq-pf-velocity that the perifocal velocity vector lies on a circle of radius $\mu/h$ centered at $(0, \mu e/h)$. Then compute $\mathbf{v}$ at every time step of the Mars simulation, rotate it back into the perifocal frame with the transpose of $Q$, and plot $v_y$ against $v_x$.
:::

::: {#exr-ch7-rotation-order}
Apply the three rotations in the wrong order, $R_z(\omega)R_x(i)R_z(\Omega)$, to Mars's perifocal state and compare with the package. For which special values of the elements does the order not matter?
:::

::: {#exr-ch7-moon-fix}
Build the Moon with `keplerian_to_state()` using $\mu = G(M_\oplus + m_{\mathrm{Moon}})$, $a = 384{,}400$ km, $e = 0.0549$, and $i = 5.15°$, add it with `add_body()`, and confirm with `measure_period()` that its period is the real 27.32 days.
:::

::: {#exr-ch7-spread}
Use `true_anomaly_at()` to place Mercury, Venus, Earth, and Mars where they would be 200 days after each one's perihelion, then simulate and plot a snapshot with `plot_system()`.
:::

::: {#exr-ch7-precession}
Extract Earth's osculating argument of perihelion $\omega$ from the Earth-Jupiter run at every time step with `get_orbital_elements()` and plot it. Does it precess steadily, oscillate, or both?
:::
