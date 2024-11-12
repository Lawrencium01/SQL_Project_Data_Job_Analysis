WITH skills_demand AS (
SELECT
	skills_dim.skill_id,
	skills,
	COUNT(skills_job_dim.job_id) demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim .skill_id
WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id,skills),
average_salary AS (
SELECT
	skills_dim.skill_id,
	skills,
	ROUND(AVG(CAST(salary_year_avg AS float)),0) avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim .skill_id
WHERE job_title_short = 'Data Analyst' AND job_work_from_home = 'true'
AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id,skills)

SELECT TOP 25
	skills_demand.skill_id,
	skills_demand.skills,
	demand_count,
	avg_salary
FROM skills_demand
INNER JOIN average_salary ON
skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC, demand_count DESC