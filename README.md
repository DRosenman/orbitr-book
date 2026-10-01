# Orbital Mechanics with R — manuscript

Quarto book project for the KDP paperback *Orbital Mechanics with R: Simulating
Planets, Binary Stars, Chaotic Systems, and the N-Body Problem with orbitr*.

## Two editions from one source

| Edition | Command | Output |
|---|---|---|
| Free online (like r4ds.hadley.nz) | `quarto render --to html` | `_book/` — a website |
| KDP paperback | `quarto render --to pdf` | `_book/Orbital-Mechanics-with-R.pdf` |

`quarto render` with no `--to` builds both. The chapters are identical; the
few differences (a welcome box, live animations and 3D plots online, static
snapshots in print) are marked with `::: {.content-visible when-format=...}`
blocks and `eval: !expr knitr::is_html_output()` chunk options.

### Publishing the website

1. Create a public GitHub repo for the book (the config assumes
   `DRosenman/orbitr-book`; change `repo-url`/`site-url` in `_quarto.yml` if
   not) and push this folder to it, **including `_freeze/`**.
2. `quarto publish gh-pages` from this folder publishes once, by hand, and
   creates the `gh-pages` branch. After that, `.github/workflows/publish.yml`
   republishes on every push to `main`, using the frozen results (no R on CI).
3. Custom domain: in the repo's Pages settings set `book.orbit-r.com` (or
   whatever you choose), add a `CNAME` DNS record at your registrar pointing to
   `drosenman.github.io`, put a file named `CNAME` containing the domain in
   this folder, and uncomment the `resources: [CNAME]` lines in `_quarto.yml`.

The workflow renders with `--to html`, so CI never needs LaTeX; the PDF for
KDP is built locally.

### License

`LICENSE.md`: text and figures CC BY-NC-ND 4.0 (read and share freely, no
commercial use, no derivatives — the same choice as r4ds); code MIT. This
protects the paperback while keeping the online edition free. Note that KDP
Select (Kindle Unlimited) requires digital exclusivity, so if you ever add a
Kindle edition, it cannot be enrolled in Select while the web edition exists;
the paperback has no such restriction.

## Rendering

Prerequisites:

- Quarto ≥ 1.4 (<https://quarto.org>)
- R ≥ 4.1 with packages: `orbitr` (≥ 1.0.0; from CRAN once it is there, or
  `remotes::install_github("DRosenman/orbitr")` with a compiler meanwhile), `dplyr` (≥ 1.1.0 — two
  hand-written self-joins use `relationship = "many-to-many"`), `ggplot2`,
  `tidyr`, `knitr`, `rmarkdown`; `plotly`, `gganimate`, `gifski` for the live
  figures in the HTML edition
- A LaTeX distribution with XeLaTeX. If you don't have one:
  `quarto install tinytex`

Then, from this directory:

```
quarto render            # builds _book/Orbital-Mechanics-in-R.pdf
quarto preview           # live preview while editing
```

The first render runs every simulation in the book (a few minutes). Results
are cached in `_freeze/` by `freeze: auto`, so later renders only re-run
chapters whose source changed. Commit `_freeze/` to version control.

## Layout

| File | Role |
|---|---|
| `_quarto.yml` | Book structure, execution defaults, website (html) and PDF/KDP settings |
| `.github/workflows/publish.yml` | Publishes the HTML edition to GitHub Pages on push |
| `LICENSE.md` | CC BY-NC-ND 4.0 for the text, MIT for the code |
| `latex/preamble.tex` | Print styling, copyright page (`\lowertitleback`) |
| `_common.R` | Sourced at the top of every chapter: packages, theme, knitr options |
| `R/helpers.R` | The few derivation helpers the text defines (period measurement, Kepler's equation, by-hand element conversion); everything else is an orbitr 1.0.0 function |
| `references.bib` | Bibliography |
| `index.qmd` | Preface |
| `the-app.qmd` | Unnumbered page after the preface: the Shiny app embedded (online) / URL + QR code (print) |
| `01-…16-*.qmd` | Chapters |
| `A-*, …, E-*.qmd` | Appendices (R basics, math background, function reference, constants, solutions) |
| `about.qmd` | About the author (last page; back-cover cut in an HTML comment) |

## Draft status

| Chapter | Status |
|---|---|
| Preface | complete |
| 1 Why Simulate Gravity? | complete |
| 2 Four Lines to an Orbit | complete |
| 3 Newton's Law and the N-Body Problem | complete |
| 4 The Two-Body Problem, Solved by Hand | complete |
| 5 Integrators | complete |
| 6 Softening | complete |
| 7 From Orbital Elements to State Vectors | complete |
| 8 The Solar System from JPL Elements | complete |
| 9 Binary Stars and Circumbinary Planets | complete |
| 10 Reference Frames | complete |
| 11 Chaos and the Three-Body Problem | complete |
| 12 Conservation Laws as Diagnostics | complete |
| 13 Comets and Highly Eccentric Orbits | complete |
| 14 Figures for Papers and Talks | complete |
| 15 The C++ Engine | complete |
| 16 Limits and Extensions | complete |
| A R Basics | complete |
| B Mathematical Background | complete |
| C Function Quick Reference | complete |
| D Physical Constants | complete (table generated from the package) |
| E Solutions | to do |

All sixteen chapters are drafted against orbitr 1.0.0. Appendix E (solutions)
is the remaining writing task.

## Things to check before publication

- **Numbers in prose.** Where the text quotes a simulation result it uses inline
  R (`` `r ...` ``) or hedged wording. A few places use round numbers from the
  derivations (e.g. "about 535 days", "$e = 0.44$"); confirm them against the
  rendered output.
- **Chapter 4, speed sweep.** The two-body vignette says the $k = 0.7$ launch
  "crashes into the star" with `softening = 0`. With an hourly step and
  $r_p = 0.32\,r_0$ it should not; the book just reports whatever the run gives.
  Check the figure.
- **Chapter 9, stability sweep.** The table is described as showing a transition
  near 2.9 binary separations. Check the actual rows; 15-year runs may put the
  edge a little lower.
- **Chapter 11, ejection.** The text assumes one star has positive energy by the
  end of the three-year run (as the vignette's animation shows). If not, extend
  `duration` in `triple()`.
- **Chapter 12, numerical precession.** The text says the 5-day run's perihelion
  rotates "through tens of degrees in a decade" and that halving the step cuts
  the rate by about four. Check the printed `rates` table and adjust the words.
- **Chapter 15, benchmarks.** The machine-dependent numbers (the ~50-body
  crossover, the bind_rows timing) are described qualitatively; re-read the
  paragraph against your own `bench` table. The kernel in the text is quoted
  verbatim from `src/enginer.cpp` (MIT).
- **Chapter 16, toy drag.** `continue_run()` in a 40-iteration loop re-binds
  the growing tibble each time; it is fine at this size but do not scale it up.
- **Render time.** Chapter 8's 170-year run and Chapter 9's sweep are the slow
  chunks (a minute or two each). They are cached by `freeze`.
- **Bibliography entries to verify against the originals:** `stormer1907`
  (page ranges), `hut1995`, `plummer1911` (issue/pages), `poincare1890` (DOI),
  `touboul2022` (author list), `doyle2011` (author list), `wickham2019`
  (author list). Add `rosenman2026preprint` (EdArXiv) and, when accepted,
  `rosenman2026joss`.
- **Acknowledgments** in `index.qmd` — placeholder, personalize.
- **Copyright page** in `latex/preamble.tex` — add the ISBN KDP assigns.

## KDP production notes

- Trim is **7 × 10 in**, set via `geometry` in `_quarto.yml`. Margins: inner
  0.875 in, outer 0.625 in, top 0.8 in, bottom 0.9 in. KDP's minimum inside
  margin for 151–300 pages is 0.5 in (0.625 in for 301–500), outside ≥ 0.25 in.
  No bleed: nothing is placed in the margins.
- Fonts: XeLaTeX embeds all fonts, which KDP requires. Default is Latin Modern.
  To switch to a book face, uncomment the `mainfont`/`sansfont`/`monofont`/
  `mathfont` lines in `_quarto.yml` (TeX Gyre Pagella + Pagella Math ship with
  TeX Live; `tlmgr install tex-gyre tex-gyre-math` on TinyTeX).
- **Color vs. black-and-white interior.** Figures use ggplot2's default
  palette. For a B&W interior (much cheaper to print), add a greyscale-friendly
  default to `_common.R`, e.g. `options(ggplot2.discrete.colour =
  scales::grey_pal(start = 0.1, end = 0.7))`, or use `linetype` as well as
  colour in the multi-method figures. Code highlighting is already
  `monochrome`.
- The cover is a separate upload (KDP's cover calculator gives the spine width
  from the final page count and paper choice).
- Set `date` only if you want it on the title page (currently omitted).
- `keep-tex: true` leaves the `.tex` in `_book/` for debugging.
- A Kindle/EPUB edition is possible (`format: epub`) but the derivation
  chapters are equation-heavy and reflowable e-readers render math poorly;
  print replica (PDF) is the realistic e-book route.
