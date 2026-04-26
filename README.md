# Life Expectancy and Economic Development

## Overview
This project analyzes the relationship between life expectancy and economic development across countries using cross sectional data from Gapminder, which compiles indicators from sources such as the World Bank.

The goal is to understand how life expectancy varies with income, and how this relationship changes when accounting for demographic factors and income inequality.

---

## Research Question
How is life expectancy related to GDP per capita, and to what extent do demographics and inequality help explain differences across countries?

---

## Data
The data comes from Gapminder, which compiles global development indicators from sources such as the World Bank.

Source: https://www.gapminder.org/data/

The raw data consists of separate country level indicator files, which are combined into a single 2022 cross sectional dataset.

The processed dataset includes:

- life expectancy  
- GDP per capita  
- fertility rate  
- median age  
- Gini coefficient  
- average daily income  

Raw data files are excluded from the repository. The processed dataset is included for reproducibility.

Observations with missing GDP per capita were removed, and all variables are expressed in comparable per person terms where applicable.

---

## Project Workflow

1. Combine raw country level indicator files
2. Create a processed 2022 modeling dataset
3. Explore relationships between income, demographics, inequality, and life expectancy
4. Estimate regression models in stages
5. Compare model fit and interpret results

## Modeling Approach

I estimate a sequence of OLS regression models:

1. Baseline model using log GDP per capita
2. Demographic model adding fertility and median age
3. Inequality model adding the Gini coefficient
4. Final model excluding median age due to multicollinearity and limited independent explanatory value

Robust standard errors are used to account for potential heteroskedasticity.

## Key Findings

- GDP per capita is strongly and positively associated with life expectancy
- Fertility is negatively associated with life expectancy and adds explanatory power beyond income
- Income inequality is negatively associated with life expectancy after accounting for income and fertility
- Median age overlaps with other predictors and is excluded from the final model

Overall, the results suggest that differences in life expectancy are related not just to income levels, but also to demographic structure and how resources are distributed.

## Repository Structure

```text
code/
  combine_data.R      # combines raw indicator files
  models.Rmd          # exploratory analysis and regression models

data/
  processed/
    combined_data_2022.csv

output/
  life_expectancy_analysis.html

```
## Report

View the full analysis here:

- [Life Expectancy Analysis](output/life_expectancy_analysis.html)

## How to Run

To reproduce the analysis:

1. Run the data preparation script:
```r
   source("code/combine_data.R")
```
2. Knit the analysis file:
```r
  code/models.Rmd
```
The output report will be generated in:
```r
  code/life_expectancy_analysis.html
```
