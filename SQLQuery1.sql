--select * from
--PortfolioProject.dbo.CovidDeath
--where continent is not NULL
--order by 2

--select * from PortfolioProject.dbo.CovidVaccination order by 3,4

--Select Data that we are going to use

--select location, date, total_cases, new_cases, total_deaths, population
--from PortfolioProject.dbo.CovidDeath
--where continent is not NULL
--order by 1,2

--Looking at Total Cases vs Total Death

--select location, date, total_cases, total_deaths, (total_deaths/cast(total_cases as int))*100 as DeathPercentage
--from PortfolioProject.dbo.CovidDeath
--where location='India'
--and continent is not NULL
--order by 1,2

--Looking at Total Cases vs Population
--Shows what percentage of population got Covid

--select location, date, population, total_cases, (total_cases/population)*100 as CovidPercentage
--from PortfolioProject.dbo.CovidDeath
--where location='India'
--and continent is not NULL
--order by 1,2

--Looking at Countries with Highest Infection Rate compared to Population

--select location, population, max(total_cases) as HighestInfectionCount,
--	MAX((Total_cases/Population))*100 as PercentPopulationInfected
--from PortfolioProject.dbo.CovidDeath
----where location like '%india%' and continent is not NULL
--group by location, population
--order by PercentPopulationInfected desc

--Showing Countries with Highest Death Count per Population

--select location, max(cast(total_deaths as int)) as TotalDeathCount
--from PortfolioProject.dbo.CovidDeath
--where continent is not null
--group by location
--order by TotalDeathCount desc

--Let's break things down by continent
--Showing continents with the highest death count per population

--select continent, max(cast(total_deaths as int)) as TotalDeathCount
--from PortfolioProject.dbo.CovidDeath
--where continent is not null
--group by continent
--order by TotalDeathCount desc

--Global Numbers

--select date, sum(new_cases), sum(cast(new_deaths as int)), sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
--from PortfolioProject.dbo.CovidDeath
--where continent is not null
--group by date
--order by 1,2

--Looking at total population vs vaccination

-- select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations
-- from PortfolioProject.dbo.CovidDeath as cd
-- join PortfolioProject.dbo.CovidVaccination as cv
-- 	on cd.location = cv.location
-- 	and cd.date = cv.date
-- where cd.continent is not null
-- order by 2,3

--USE CTE

--with popvsvac (continent, location, date, population, new_vaccination, rollingpeoplevaccinated)
--as
--(
--	select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
--	sum(convert(int, cv.new_vaccinations)) over(partition by cd.location,
--	cd.date) as rollingpeoplevaccinated
--	from PortfolioProject..CovidDeath cd
--	join PortfolioProject..CovidVaccination cv
--	on cd.location = cv.location
--	and cd.date = cv.date
--	where cd.continent is not null
--)
--select *, (rollingpeoplevaccinated/population)*100
--from popvsvac

--USE TEMP TABLE

--drop table if exists #PercentPopulationVaccinated
--create table #PercentPopulationVaccinated
--(
--Continet nvarchar(255),
--Location nvarchar(255),
--Date datetime,
--Population numeric,
--New_vaccinations numeric,
--RollingPeopleVaccinated numeric
--)

--insert into #PercentPopulationVaccinated
--select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
--	sum(convert(int, cv.new_vaccinations)) over(partition by cd.location,
--	cd.date) as rollingpeoplevaccinated
--	from PortfolioProject..CovidDeath cd
--	join PortfolioProject..CovidVaccination cv
--	on cd.location = cv.location
--	and cd.date = cv.date
--	where cd.continent is not null
--  order by 2,3

--select *, (RollingPeopleVAccinated/Population)*100
--from #PercentPopulationVaccinated

--Creating View to store data for later visualizations

--create View PercentPopulationVaccinated as
--select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
--	sum(convert(int, cv.new_vaccinations)) over(partition by cd.location,
--	cd.date) as rollingpeoplevaccinated
--	from PortfolioProject..CovidDeath cd
--	join PortfolioProject..CovidVaccination cv
--	on cd.location = cv.location
--	and cd.date = cv.date
--	where cd.continent is not null
--    order by 2,3