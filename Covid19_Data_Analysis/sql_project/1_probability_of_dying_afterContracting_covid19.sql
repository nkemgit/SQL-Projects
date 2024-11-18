	-- looking for propability of dying after contracting covid in the United Kingdom

SELECT 
    location, 
    date, 
    total_cases, 
    total_deaths,
    (CAST(total_deaths AS FLOAT) / CAST(total_cases AS FLOAT)) * 100 AS DeathPercentage
FROM ProjectPortfolio..CovidDeathsData
WHERE location LIKE '%United Kingdom%' AND total_deaths IS NOT NULL
ORDER BY 
    location, 
    date;





	-- looking for propability of dying after contracting covid in the US

SELECT 
    location, 
    date, 
    total_cases, 
    total_deaths,
    (CAST(total_deaths AS FLOAT) / CAST(total_cases AS FLOAT)) * 100 AS DeathPercentage
FROM ProjectPortfolio..CovidDeathsData
WHERE location LIKE '%states%' AND total_deaths IS NOT NULL 
ORDER BY 
    location, 
    date;





