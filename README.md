# COVID-19 Data Analysis Project

This project involves the analysis of COVID-19 data, specifically focusing on death counts, vaccination rates, and their relationships with population statistics. The SQL queries are designed to extract meaningful insights from the provided database tables (`CovidDeath` and `CovidVaccination`).

## Queries Overview

- **Data Selection:**
  - Extracting relevant data for analysis, excluding records where the continent is NULL.

- **Total Cases vs Total Death:**
  - Investigating the death percentage concerning total cases, focusing on a specific location (e.g., India).

- **Total Cases vs Population:**
  - Analyzing the percentage of the population affected by COVID-19 in a specific location.

- **Highest Infection Rate by Population:**
  - Identifying countries with the highest infection rates compared to their populations.

- **Highest Death Count per Population:**
  - Listing countries with the highest death counts per population.

- **Continent-wise Death Count:**
  - Analyzing continents with the highest death counts per population.

- **Global Numbers:**
  - Summarizing global new cases, new deaths, and death percentages over time.

- **Vaccination Analysis:**
  - Exploring the relationship between population, vaccination, and the rolling count of vaccinated people.

## Usage

### Temporary Table Approach

1. Execute the SQL queries, including the creation of the `#PercentPopulationVaccinated` temporary table.
2. View the results using the final SELECT statement on the temporary table.

### Common Table Expression (CTE) Approach

1. Uncomment the CTE section and execute the SQL queries.
2. View the results using the final SELECT statement on the CTE.

### View Creation

1. Uncomment the View creation section to store the data for later visualizations.

## Visualization

This project is designed to be part of a larger data analysis effort. The results can be visualized using business intelligence tools or incorporated into data visualization platforms.

## Requirements

- SQL Server or a compatible database engine.

## Contributors

- Sanil Kumar Barik

Feel free to contribute, provide feedback, or open issues.
