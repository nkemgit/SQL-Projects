
--total death count per continent by economic status of each countries in the continent

SELECT 
	location, 
		Max(CAST(total_deaths AS INT)) AS ContinentTotalDeathsCount
FROM ProjectPortfolio..CovidDeathsData
WHERE continent IS NULL AND location NOT IN ('High income', 'Low income', -- filter non countries from the list
		'Upper middle income', 'Lower middle income', 'World')
GROUP BY location
ORDER BY ContinentTotalDeathsCount DESC
;

/*
Europe has the highest total death count at 2,101,563, followed by North America with 1,668,436 and 
Asia with 1,637,201. South America also has a significant count at 1,354,386. In contrast, 
Africa and Oceania report much lower totals, with 259,101 and 32,819 deaths, respectively. 
This data highlights the severe impact on Europe and North America compared to other continents.
*/


SELECT 
	continent, 
		Max(CAST(total_deaths AS INT)) AS TotalDeathsCount
FROM ProjectPortfolio..CovidDeathsData
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathsCount DESC
;

/*
The data showed a similar trend to the death count in relation to economic status, but with different figures.
*/
