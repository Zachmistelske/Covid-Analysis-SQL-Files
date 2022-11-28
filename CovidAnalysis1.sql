--Looking at Master table for analysis.
SELECT *
FROM Covid_Analysis..['Covid_Table']
WHERE Total_deaths is not null AND total_cases is not null;

--Finding the death percentages, the average number of patients in intensive care and hospitals from covid by country.
SELECT Location, MAX(cast(total_deaths as int))/MAX(total_cases) AS Death_Percentage, MAX(cast(total_deaths as int)) AS deaths, MAX(total_cases) AS cases, AVG(cast(icu_patients as int)) AS icu_patients_per_day, AVG(cast(hosp_patients as int)) AS Average_hospital_patients_per_day, AVG(cast(positive_rate as float)) AS Avg_Positivity_rate
FROM Covid_Analysis..['Covid_Table']
WHERE total_deaths is not null AND total_cases is not null AND icu_patients is not null AND hosp_patients is not null AND positive_rate is not null
GROUP BY Location
ORDER BY Location ASC;

--Showing number of patients in intensive care and hospitals from covid, total tests, total deaths, and total cases by day and country.
SELECT Location, date, icu_patients, hosp_patients, total_cases, total_deaths, total_tests
FROM Covid_Analysis..['Covid_Table']
WHERE icu_patients is not null AND total_cases is not null AND hosp_patients is not null AND total_deaths is not null AND total_tests is not null
ORDER BY Location ASC;

--Calculating the average world death percentage to be imported in python

SELECT MAX(cast(total_deaths as int))/MAX(total_cases) AS Death_Percentage
FROM Covid_Analysis..['Covid_Table']
WHERE total_deaths is not null AND total_cases is not null
GROUP BY Location, population
ORDER BY Location ASC;
