-- TEMP TABLE
-- lets create temporatry table from CTE1

DROP TABLE IF EXISTS PercentagePopulationVaccinated;
CREATE TABLE PercentagePopulationVaccinated (
	continent NVARCHAR (255),
	location NVARCHAR (255),
	date DATETIME ,
	population NUMERIC, 
	new_vaccinations NUMERIC,
	rollingPeopleVaccinated NUMERIC
	)
											
INSERT INTO PercentagePopulationVaccinated 
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
--ORDER BY cd.location, cd.date

SELECT *, (rollingPeopleVaccinated / Population) * 100  AS PercentagePeopleVac
FROM PercentagePopulationVaccinated 
;

