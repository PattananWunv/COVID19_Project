

--1.

SELECT SUM(new_cases) as total_cases, SUM(TRY_CAST(new_deaths as int)) as total_deaths, 
	SUM(TRY_CAST(new_deaths as int)) / SUM(new_cases)*100 as DeathPercentage
FROM CovidProject..CovidDeaths
WHERE continent is not null
	AND continent <> 'NULL'
order by 1, 2


--2.

SELECT continent, SUM(TRY_CAST(new_deaths as int)) as TotalDeathCount
FROM CovidProject..CovidDeaths
WHERE continent is not null
	AND continent <> 'NULL'
--	AND location not in ('World', 'European Union', 'International')
Group by continent
order by TotalDeathCount desc


--3.

SELECT location, population, MAX(total_cases) as HighestInfectionCount, 
	MAX((TRY_CONVERT(float, total_cases)/NULLIF(TRY_CONVERT(float, population), 0)))*100 as PercentPopulationInfected
FROM CovidProject..CovidDeaths
WHERE continent is not null
	AND continent <> 'NULL'
Group by location, population
order by PercentPopulationInfected desc


--4.

SELECT location, date, population, MAX(total_cases) as HighestInfectionCount, 
	MAX((TRY_CONVERT(float, total_cases)/NULLIF(TRY_CONVERT(float, population), 0)))*100 as PercentPopulationInfected
FROM CovidProject..CovidDeaths
WHERE continent is not null
	AND continent <> 'NULL'
Group by location, date, population
order by PercentPopulationInfected desc