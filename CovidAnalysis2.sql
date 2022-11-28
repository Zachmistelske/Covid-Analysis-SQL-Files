--total tests vs total cases and total deaths by day for select countries.
SELECT Location, date, total_tests, total_cases, total_deaths
FROM Covid_Analysis..['Covid_Table']
WHERE total_deaths is not null AND total_cases is not null AND total_tests is not null AND Location = 'United States' OR Location = 'Germany' OR Location = 'Russia' OR Location = 'India' OR Location = 'United Kingdom' OR Location = 'Australia' OR Location = 'Malaysia' OR Location = 'Japan' OR Location = 'Canada' OR Location = 'Bolivia' OR Location = 'South Africa' OR Location = 'Portugal' OR Location = 'France' OR Location = 'Spain' OR Location = 'Ireland' OR Location = 'Italy' OR Location = 'Netherlands' OR Location = 'Austria' OR Location = 'Romania' OR Location = 'Bulgaria' OR Location = 'Sweden' OR Location = 'Finland' OR Location = 'Latvia' OR Location = 'Estonia' OR Location = 'Denmark' OR Location = 'Israel';

-- NOTE: Countries have to be filtered due to overflow of data calculations.

--Looking at cases and vaccinations for select countries.
SELECT Location, date, total_tests, total_cases, total_deaths, total_vaccinations, people_vaccinated, people_fully_vaccinated, total_boosters
FROM Covid_Analysis..['Covid_Table']
WHERE total_tests is not null AND total_cases is not null AND total_deaths is not null AND Location = 'United States' OR Location = 'Germany' OR Location = 'Russia' OR Location = 'India' OR Location = 'China' OR Location = 'Australia' OR Location = 'Malaysia' OR Location = 'Japan' OR Location = 'Canada' OR Location = 'Bolivia' OR Location = 'South Africa' OR Location = 'Portugal' OR Location = 'France' OR Location = 'Spain' OR Location = 'Ireland' OR Location = 'Italy' OR Location = 'Netherlands' OR Location = 'Austria' OR Location = 'Romania' OR Location = 'Bulgaria' OR Location = 'Sweden' OR Location = 'Finland' OR Location = 'Latvia' OR Location = 'Estonia' OR Location = 'Denmark' OR Location = 'Israel';

--Looking at the percentage of people infected, older than 65, positivity rate, who smoke by gender, percentage of cardiovasc_deaths, and people vaccinated for select countries.
SELECT Location, Population, MAX(total_cases)/MAX(cast(total_tests as int)) AS Positivity_rate, MAX(aged_65_older)/100 AS prc_people_older_than_65, MAX(cast(female_smokers as float))/100 AS prc_female_smokers, MAX(cast(male_smokers as float))/100 AS prc_male_smokers, ((MAX([cardiovasc_death_rate/100,000])*1000)/population) AS prc_card_vasc_deaths, MAX(total_cases)/population AS prc_People_infected, MAX(cast(people_vaccinated as int))/[population] AS prc_vaccinated, MAX(cast(people_fully_vaccinated as int))/[population] AS prc_fully_vaccinated, MAX(cast(total_boosters as int))/[population] AS prc_with_boosters
FROM Covid_Analysis..['Covid_Table']
WHERE total_tests is not null AND people_vaccinated is not null AND total_cases is not null AND people_fully_vaccinated is not null AND total_boosters is not null AND Location = 'United States' OR Location = 'United Kingdom' OR Location = 'India' OR Location = 'Germany' OR Location = 'Russia' OR Location = 'Australia' OR Location = 'Malaysia' OR Location = 'Japan' OR Location = 'Canada' OR Location = 'Bolivia' OR Location = 'South Africa' OR Location = 'Portugal' OR Location = 'France' OR Location = 'Spain' OR Location = 'Ireland' OR Location = 'Italy' OR Location = 'Netherlands' OR Location = 'Austria' OR Location = 'Romania' OR Location = 'Bulgaria' OR Location = 'Sweden' OR Location = 'Finland' OR Location = 'Latvia' OR Location = 'Estonia' OR Location = 'Denmark' OR Location = 'Israel'
GROUP BY Location, population
ORDER BY Location ASC;

