# Life Expectancy and Economic Development

## Overview
This project analyzes the relationship between life expectancy and economic development across countries using cross sectional data from Gapminder, which compiles indicators from sources such as the World Bank.

The goal is to understand how life expectancy varies with income, and how this relationship changes when accounting for demographic factors and income inequality.

---

## Research Question
How is life expectancy related to GDP per capita, and to what extent do demographics and inequality help explain differences across countries?

---

## Data
The data is sourced from Gapminder and includes country level indicators for 2022. Multiple datasets were merged by country identifiers to construct a single cross sectional dataset.

Key variables:
- Life expectancy
- GDP per capita
- Fertility rate (children per woman)
- Income inequality (Gini coefficient)

Observations with missing GDP per capita were removed, and all variables are expressed in comparable per person terms where applicable.

---

## Methodology
We estimate a series of linear regression models to examine how the relationship evolves as additional variables are introduced.

1. Baseline model  
   Life expectancy is regressed on log GDP per capita

2. Demographic extension  
   Adds fertility as a key demographic control

3. Final model  
   Incorporates income inequality to capture distributional effects

Robust standard errors are used throughout to account for potential heteroskedasticity.

---

## Key Findings
- GDP per capita is positively associated with life expectancy, with diminishing returns captured through the log transformation
- Fertility has a strong negative relationship with life expectancy, reflecting demographic differences across countries
- Income inequality is negatively associated with life expectancy, even after controlling for income and demographics

Overall, the results suggest that differences in life expectancy reflect not just how wealthy countries are, but also how populations are structured and how resources are distributed.

---
