---
title: HOMEWORK 4
author: YI YIN
description: Homework 4
---

# HOMEWORK 4

##Goal: Functional Programming with `purrr`

## Featured Package(s)

- `purrr`
- `dplyr`

## Difficulties I come with

- **Failure Handing in pipeline**: result structure of `safely()`, `transpose() `and use `pluck('result')` to extract the result. The difference between `safely() ` and `possibly()`, `safely() `returns more results, so we should use `safely()` when we care about the error message. If we do not care the error message, using `possibly()` simply plug in `NA_real_` may be a good choice, since we can avoid the nested list structure of `safely()` result.
- **Indexing list in pipeline**: use `.$xx` for name index, or `map("x")`
- **List structure of coefficient results**: use `summary(lm(y ~ x, data = dat))$coefficients['x', 'Pr(>|t|)'] ` to extract the slope p-value, coefficients in a nested list in summary result list.
- **Name of named vector**: sometimes, each value of one dimensional vector is associate with a name, to convert into a tibble or dataframe, but remain the name as a column we can use `attr(., "names")`

## Extra Things I have learned

- [ ] Data structure is important

- [ ] Pipe as possible as you can, keep the environment clean

- [ ] Take a try, knowing the structure from really simple piece of data.

  > List can be convenient, but messy -- My thought