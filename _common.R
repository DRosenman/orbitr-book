# Shared setup, sourced at the top of every chapter.
suppressPackageStartupMessages({
  library(orbitr)
  library(dplyr)
  library(ggplot2)
})

# Analysis helpers introduced in Chapters 4 and 5 (see R/helpers.R).
source("R/helpers.R")

# A clean, print-friendly default theme for every figure in the book.
theme_set(theme_minimal(base_size = 10))

options(dplyr.summarise.inform = FALSE)

knitr::opts_chunk$set(
  fig.align = "center",
  out.width = "100%",
  collapse  = TRUE,
  comment   = "#>"
)
