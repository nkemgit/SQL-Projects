-- Looking at total cases vs population
-- show population that got covid

SELECT
	location, 
	date, 
	total_cases, 
	population,
	(CAST(total_cases AS FLOAT)/CAST(population AS FLOAT)) * 100 AS PercentPopulationInfected
FROM ProjectPortfolio..CovidDeathsData
--WHERE location = '' you can drilling down by selection any country of your chioce
ORDER BY 1, 2
;