SELECT 
	job_title_short,
	job_location,
	job_via,
	salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY salary_year_avg