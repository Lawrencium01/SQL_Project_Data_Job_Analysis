SELECT 
	SUM(CAST(salary_year_avg AS float)) salary_sum,
	COUNT(*) count_rows
FROM job_postings_fact

SELECT 
	COUNT(DISTINCT(job_title_short)) job_type_total
FROM job_postings_fact

SELECT
	job_title_short AS jobs,
	COUNT(job_title_short) job_count,
	AVG(CAST(salary_year_avg AS float)) salary_avg,
	MIN(CAST(salary_year_avg AS float)) salary_min,
	MAX(CAST(salary_year_avg AS float)) salary_max
FROM job_postings_fact
GROUP BY job_title_short
HAVING COUNT(job_title_short) > 100
ORDER BY salary_avg

