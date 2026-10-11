# CSE 270 lectures

This repository is the lecture sources and the knitted PDFs. Slide images sit next to the `.Rmd` that uses them. Course tables are not stored here.

## Knit after clone

```r
remotes::install_github("Habet/CSE270", ref = "feature/small-lecture-data")
```

Then open a lecture `.Rmd` and knit it. `data(f_data_sm)`, `data(epl)`, `data(nba_games)`, and the smaller lecture tables (`nba5`, `nba11_12`, `usa`, `marvel`, `census`, and the others added on that package branch) come from **SportsAnalytics270**.

`install_github("Habet/CSE270")` without `ref` installs `master`, which has the original course tables and not yet the smaller lecture extracts.

## What lives where

| Repo | Role |
| --- | --- |
| `sahNarek/sportsAnalyticsMd` | Lecture `.Rmd`, PDF, and images |
| `Habet/CSE270` | `SportsAnalytics270`: functions and datasets used by `data()` |
| `sahNarek/CSE270DataCollection` | Scrapers that write `datasets/<name>/<name>.rda` |

Assignments, quizzes, and instructor solutions are not in this repository.

Expected-goals files, Transfermarkt dumps, and other files over 2 MB are not in this repository. They will be reached later through helpers on the package, backed by a bucket, not through local paths.
