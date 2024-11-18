-- Showing top 10 countries with highest death count

SELECT TOP 10
	Location, 
		Max(CAST(total_deaths AS INT)) AS TotalDeathsCount
FROM ProjectPortfolio..CovidDeathsData
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathsCount DESC
;

/*
The data shows the United States has the highest total deaths at 1,190,579, 
followed by Brazil with 702,116 and India with 533,622. The United Kingdom 
ranks sixth with 232,112 deaths. This suggests significant differences in impact
 among these top 10 countries.
 */