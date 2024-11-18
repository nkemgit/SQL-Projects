-- FROM COVID VACCINATION TABLE 
-- Looking at Total Population vs Vaccination, we join the both table together 


SELECT 
    cd.continent, 
    cd.location, 
    cd.date, 
    cd.population, 
    cv.new_vaccinations,
    SUM(CAST(cv.new_vaccinations AS FLOAT)) 
    OVER (PARTITION BY cd.location ORDER BY cd.date) AS rollingPeopleVaccinated
FROM ProjectPortfolio..CovidDeathsData cd
JOIN ProjectPortfolio..CovidVaccinationData cv
    ON cd.location = cv.location
    AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
--AND cd.location like '%canada%'
ORDER BY cd.location, cd.date;



-- USE CTE

WITH PopvsVac (
	Continent, 
	Location, 
	Date, 
	Population, 
	New_vaccinations,  rollingPeopleVaccinated) AS
(SELECT 
    cd.continent, 
    cd.location, 
    cd.date, 
    cd.population, 
    cv.new_vaccinations,
    SUM(CAST(cv.new_vaccinations AS FLOAT)) 
    OVER (PARTITION BY cd.location ORDER BY cd.date) AS rollingPeopleVaccinated
FROM ProjectPortfolio..CovidDeathsData cd
JOIN ProjectPortfolio..CovidVaccinationData cv
    ON cd.location = cv.location
    AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
) 
SELECT *, (rollingPeopleVaccinated / Population) * 100 AS PercentagePopulationVac 
FROM PopvsVac
;



-- looking for percentage vacinted for individual countries let take 'Andorra' as case study

WITH PeopleVacinted_CTE (
	Continent, 
	Location, 
	Date, 
	Population, 
	New_vaccinations,  rollingPeopleVaccinated) AS
(SELECT 
    cd.continent, 
    cd.location, 
    cd.date, 
    cd.population, 
    cv.new_vaccinations,
    SUM(CAST(cv.new_vaccinations AS FLOAT)) 
    OVER (PARTITION BY cd.location ORDER BY cd.date) AS rollingPeopleVaccinated
FROM ProjectPortfolio..CovidDeathsData cd
JOIN ProjectPortfolio..CovidVaccinationData cv
    ON cd.location = cv.location
    AND cd.date = cv.date
WHERE cd.continent IS NOT NULL 
	AND cd.location LIKE 'Andorra'
) 
SELECT *, (rollingPeopleVaccinated / Population) * 100 AS PercentagePopulationVac 
FROM PeopleVacinted_CTE
;
