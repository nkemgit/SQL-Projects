
-- looking at top10, countries with highest infection rate compared to population

SELECT TOP 10
	Location, 
	Population, 
		MAX(total_cases) AS HighestInfectionCount,
		MAX((CAST(total_cases AS FLOAT)/CAST(population AS FLOAT)) * 100) AS MaxPercentPopulationInfected
FROM ProjectPortfolio..CovidDeathsData
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY MaxPercentPopulationInfected DESC
;

/*The data shows the maximum percentage of the population infected in various locations. 
Cyprus has the highest infection rate at 77.44%, followed closely by Brunei at 77.11% and 
San Marino at 75.07%. Austria and South Korea have rates of 68.04% and 66.72%, respectively. 
The data suggests that smaller populations, such as Cyprus and Brunei, may experience higher 
proportional impacts, while larger countries like South Korea still show significant infection 
percentages. This reflects varying degrees of susceptibility, transmission, or reporting practices
 across regions.
 */