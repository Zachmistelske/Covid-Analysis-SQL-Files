--Finding average positivity rate from data for python calculations.

SELECT MAX(total_cases)/MAX(cast(total_tests as int)) AS Positivity_rate
FROM Covid_Analysis..['Covid_Table']
WHERE Total_tests is not null AND Total_cases is not null AND Location = 'United States' OR Location = 'United Kingdom' OR Location = 'India' OR Location = 'Germany' OR Location = 'Russia' OR Location = 'Australia' OR Location = 'Malaysia' OR Location = 'Japan' OR Location = 'Canada' OR Location = 'Bolivia' OR Location = 'South Africa' OR Location = 'Portugal' OR Location = 'France' OR Location = 'Spain' OR Location = 'Ireland' OR Location = 'Italy' OR Location = 'Netherlands' OR Location = 'Austria' OR Location = 'Romania' OR Location = 'Bulgaria' OR Location = 'Sweden' OR Location = 'Finland' OR Location = 'Latvia' OR Location = 'Estonia' OR Location = 'Denmark' OR Location = 'Israel'
GROUP BY Location, population
ORDER BY Location ASC;

