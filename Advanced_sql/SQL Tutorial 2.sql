-- Practice Problem 1

SELECT 
	job_title_short,
	job_location,
	job_via,
	salary_year_avg
FROM job_postings_fact
WHERE job_location IN ('Boston, MA','Anywhere') AND(
		(job_title_short = 'Data Analyst' AND salary_year_avg > CAST(100000 AS float)) OR
		(job_title_short = 'Business Analyst' AND salary_year_avg > CAST(70000 AS float)))


--Wildcard
SELECT 
	job_id,
	job_title,
	job_title_short,
	job_location
FROM job_postings_fact
--WHERE job_title LIKE '%Business%Analyst%'
WHERE job_title LIKE '%Business_Analyst%'

--Alias
SELECT 
	job_title_short AS job_title,
	job_location AS location,
	job_via AS online_platform,
	salary_year_avg AS Salary
FROM job_postings_fact



--Practice Problem 2
SELECT 
	job_title,
	job_location location,
	salary_year_avg salary
FROM job_postings_fact
WHERE (job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
		job_title LIKE '%Analyst%' AND
		job_title NOT LIKE '%senior%'