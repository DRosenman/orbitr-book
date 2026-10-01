<!-- Parked exercises for 03-newton-and-the-n-body-problem.qmd. Not rendered. Restore to the end of the chapter
     (with a solutions appendix) when the solutions are written. -->

## Exercises {.unnumbered}

::: {#exr-ch3-ratio}
Using the constants in the package, compute the acceleration of Earth due to the Sun, due to the Moon, and due to Jupiter at its closest approach (Jupiter's distance from the Sun minus Earth's). Express the last two as fractions of the first.
:::

::: {#exr-ch3-shell}
A hollow spherical shell of mass $M$ and radius $R$ has a small hole drilled in it. A pebble is dropped into the hole. Describe its motion inside the shell. (No calculation needed, but say which theorem you are using.)
:::

::: {#exr-ch3-vectorize}
Rewrite `accelerations()` without the inner loop: for a fixed $j$, compute the difference vectors to all other bodies at once with `sweep()` or by subtracting a row from the matrix, and sum the contributions with `colSums()`. Check that it gives the same answer on the Sun-Earth-Moon system.
:::

::: {#exr-ch3-g}
Simulate the Earth-Moon system for 28 days with `create_system(G = gravitational_constant * 1.01)` and again with the standard value. By how much does the Moon's position differ at the end? Is a 1% change in $G$ detectable from one month of orbit data?
:::
