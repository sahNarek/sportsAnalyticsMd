---
title: "CSE 270 Sports Analytics"
subtitle: "Project requirements"
author: "Narek Sahakyan"
fontsize: 11pt
geometry: margin=1in
---

The paper is the plan of the project. It is not the finished analysis. A problem that is stated clearly is already half solved. Write four sections, in this order.

# 1. Problem

State the problem in a few sentences.

- Name the sport, the league, and the seasons.
- Say what you are trying to explain or decide.
- Say why the answer is not obvious from the league table alone.

Stay with one problem. "Is competitive balance related to attendance in Serie A from 2005 to 2024?" is a problem. "Sports analytics of football and basketball" is not.

# 2. Question and hypothesis

Write one question that the data can answer, and one hypothesis. The hypothesis is a sentence that can turn out to be false.

A useful hypothesis names the direction. "Lower dHHI comes with higher attendance" can be checked. "We will look at competitive balance" cannot.

Examples you may adapt. Do not copy one unless it is actually your project.

- Teams that finish more than five wins above their Pythagorean expectation fall back toward that expectation the next season.
- A Serie A season with a higher dHHI has more predictable matches, so the Brier score of the bookmaker probabilities is lower.
- MLB seasons with a higher salary HHI also have a higher win HHI. Payroll concentration and win concentration move together.
- The NFL Noll-Scully number is larger in seasons when the spread of team payrolls is larger.
- The share of titles won by the top four clubs in a league is stable over a decade. A high championship concentration is not a one-year accident.

If your hypothesis uses one of the course measures, say which way the number runs. For the standard deviation, Noll-Scully, C5, the championship concentration index, HHI, dHHI, and Depken's HHI, a lower number means a more competitive season or a more even history. For 1 minus C5, a lower number means less competitive. For the Brier score, a lower number means the matches were easier to call.

# 3. Data

Name the table you will use and the columns you need. One row should be one observation: a team-season, a match, or a player-season. Say which.

For each dataset, record:

- Source. Course data from `SportsAnalytics270` is enough when it contains the columns. If it does not, name the outside source.
- Seasons and leagues.
- Variables. For a competitive-balance project the usual columns are wins, losses, points, rank, and the number of teams. For a Pythagorean project you need runs scored and runs allowed. For match uncertainty you need odds and the full-time result.
- What you still need and do not have. Attendance, revenue, and injuries are not in the course tables. Write that down if the hypothesis depends on them.

Do not plan a result the table cannot support. A championship concentration index needs many seasons. A Brier score needs match odds. Depken's HHI needs the same number of games for every team, so a 60-game season cannot be dropped into a 162-game formula without saying so.

# 4. Methodology

Write the steps in the order you will run them.

1. The measure. Give the formula in words or in symbols, and the benchmark. Noll-Scully is compared with 1. HHI for an even league is $1/n$. dHHI for an even league is 0.
2. The comparison. Across seasons, between leagues, or against the benchmark. If the number of teams changes, use a measure that allows for that, such as dHHI rather than raw HHI.
3. The result that would support the hypothesis, and the result that would not. A correlation, a regression slope, or a before-and-after gap is enough. State the sign you expect.
4. One check that the number is not an artifact. A change in the number of teams, a short season, or duplicate rows can move HHI without any change in balance.
