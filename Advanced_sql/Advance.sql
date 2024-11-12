SELECT 
	COUNT(job_id) number_of_jobs,
	CASE
		WHEN job_location = 'Anywhere' THEN 'Remote'
		WHEN job_location = 'New York, NY' THEN 'local'
		ELSE 'Onsite'
	END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst '
GROUP BY location_category 

--Subqueries
SELECT 
	*
FROM (
	SELECT * FROM job_postings_fact
	WHERE MONTH(job_posted_date) = 1
	) janaury_jobs


SELECT 
	company_id,
	name company_name
FROM company_dim
WHERE company_id IN (
	SELECT
	company_id
	FROM job_postings_fact
	WHERE job_no_degree_mention = 'true'
	
)
ORDER BY company_id


--CTE
with janaury_jobs as (
	SELECT * FROM job_postings_fact
	WHERE MONTH(job_posted_date) = 1
)
SELECT * FROM janaury_jobs


WITH company_job_count AS (
	SELECT
		company_id,
		COUNT(*) total_jobs
	FROM job_postings_fact
	GROUP BY company_id)
SELECT 
	company_dim.name company_name,
	company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON
company_dim.company_id = company_job_count.company_id
ORDER BY total_jobs DESC


--Practice Problem 7
with remote_job_skill as (
SELECT
	skill_id,
	COUNT(*) skill_count
FROM skills_job_dim skills_to_job
INNER JOIN job_postings_fact job_postings
ON skills_to_job.job_id = job_postings.job_id
WHERE job_work_from_home = 'true' AND
job_title_short = 'Data Analyst'
GROUP BY skill_id)
SELECT TOP 5
	skills.skill_id,
	skills skill_name,
	skill_count
FROM remote_job_skill
INNER JOIN skills_dim skills 
ON skills.skill_id = remote_job_skill.skill_id
ORDER BY skill_count DESC





