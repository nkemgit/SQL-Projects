--DATA EXPLORATION OF COVID19 DATA SET
-- Below are data sources and process involved
/*
--split the large dataset into CovidDeaths dataset and Covid Vaccination dataset
--Download the the dataset [https://ourworldindata.org/covid-deaths]	
--Download the dataset of covid vaccinations dataset [https://tinyurl.com/5yryh9e8]
--Download dataset for covid deaths dataset [https://tinyurl.com/nhhz63rn]
*/

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types


 	SELECT *
	FROM ProjectPortfolio..CovidDeathsData
	;

	SELECT *
	FROM ProjectPortfolio..CovidVaccinationData
	;   