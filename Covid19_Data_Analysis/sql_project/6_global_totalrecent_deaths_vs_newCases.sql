-- looking at global total number of recent deaths vs new cases

SELECT 
	SUM(new_cases) AS total_new_cases,
	SUM(new_deaths) AS total_new_deaths,
	(SUM(new_deaths)/SUM(new_cases))*100 AS DeathsPercentage
FROM ProjectPortfolio..CovidDeathsData
WHERE continent IS NOT NULL
ORDER BY 1, 2
;

/*
The data indicates a total of 775,741,465 new cases and 7,057,367 new deaths, resulting in a deaths 
percentage of approximately 0.91%. This suggests that out of all reported new cases, less than 1% 
resulted in death, highlighting the case fatality rate in the context of the data provided.
*/

-- to avoid divisible error in the future we add logic to control the new data

SELECT 
	date, 
		SUM(CAST(new_cases AS INT)) AS total_new_cases, 
		SUM(new_deaths) AS total_new_deaths, 
		CASE
			WHEN SUM(CAST(new_cases AS INT))  > 0 THEN (SUM(new_deaths)/SUM(new_cases))*100
			ELSE NULL
		END AS DeathPercentage
FROM ProjectPortfolio..CovidDeathsData
WHERE continent IS NOT NULL 
GROUP BY date
ORDER BY  DeathPercentage
;