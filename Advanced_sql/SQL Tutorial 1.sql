SELECT DISTINCT
	job_title_short
FROM job_postings_fact

SELECT DISTINCT
	salary_year_avg
FROM job_postings_fact

SELECT 
	job_title_short,
	job_location,
	job_via,
	salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > 90000

SELECT 
	job_title_short,
	job_location,
	job_via,
	salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC


-- Comparison Operator

SELECT 
	job_title_short,
	job_location,
	job_via,
	salary_year_avg
FROM job_postings_fact
WHERE job_via <> 'via Ai-Jobs.net'

SELECT 
	job_title_short,
	job_location,
	job_via,
	salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > 50000

SELECT 
	job_title_short,
	job_location,
	job_via, 
	salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > CAST(100000 AS float) OR job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC

SELECT 
	job_title_short,
	job_location,
	job_via, 
	salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg BETWEEN CAST(100000 AS float) AND CAST(200000 as float)
ORDER BY salary_year_avg DESC

SELECT 
	job_title_short,
	job_location,
	job_via, 
	salary_year_avg
FROM job_postings_fact
WHERE job_title_short IN ('Data Analyst','Data Engineer','Data Scientist')

