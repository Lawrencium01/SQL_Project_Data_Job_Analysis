SELECT 
	job_title_short,
	company_id,
	job_location
FROM january_jobs 
UNION ALL
SELECT 
	job_title_short,
	company_id,
	job_location
FROM february_jobs 
UNION ALL
SELECT 
	job_title_short,
	company_id,
	job_location
FROM march_jobs 


--Practice Problem 8
SELECT 
	quarter1_job_postings.job_title_short,
	quarter1_job_postings.job_location,
	quarter1_job_postings.job_via,
	CAST(quarter1_job_postings.job_posted_date AS date) Date,
	quarter1_job_postings.salary_year_avg
FROM(
SELECT
	* 
FROM january_jobs
UNION ALL
SELECT 
	*
FROM february_jobs
UNION ALL
SELECT 
	*
FROM march_jobs) quarter1_job_postings
WHERE quarter1_job_postings.salary_year_avg > CAST(70000 AS float) AND
	quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY quarter1_job_postings.salary_year_avg DESC