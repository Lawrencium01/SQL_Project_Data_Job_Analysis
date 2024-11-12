SELECT 
	job_title_short title,
	job_location location,
	CAST(job_posted_date AS date) date
FROM job_postings_fact

SELECT TOP 5
	job_title_short title,
	job_location location,
	job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time' date_time,
	MONTH(job_posted_date) date_month,
	YEAR(job_posted_date) date_year
FROM job_postings_fact


SELECT 
	COUNT(job_id) job_posted_count,
	MONTH(job_posted_date) date_month
FROM job_postings_fact	
WHERE job_title_short = 'Data Analyst'
GROUP BY MONTH(job_posted_date)
ORDER BY job_posted_count DESC


-- Practice Problem 6

--January
SELECT 
	*  INTO january_jobs
FROM job_postings_fact
WHERE MONTH(job_posted_date) = 1

--February
SELECT 
	* INTO february_jobs
FROM job_postings_fact
WHERE MONTH(job_posted_date) = 2 

--March
SELECT 
	* INTO march_jobs
FROM job_postings_fact
WHERE MONTH(job_posted_date) = 3 

SELECT job_posted_date FROM march_jobs

