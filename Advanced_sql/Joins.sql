SELECT 
	job_posting.job_id,
	job_posting.job_title_short title,
	name company
FROM job_postings_fact job_posting
RIGHT JOIN company_dim companies ON job_posting.company_id = companies.company_id


SELECT 
	job_posting.job_id,
	job_posting.job_title title,
	skills_to_job.skill_id,
	skills.skills
FROM job_postings_fact job_posting
INNER JOIN skills_job_dim skills_to_job ON job_posting.job_id = skills_to_job.job_id
INNER JOIN skills_dim skills ON  skills_to_job.skill_id = skills.skill_id


--Practice Problem 5
SELECT 
	skills,
	COUNT(skills_to_job.job_id) number_of_job_posting,
	AVG(CAST(job_posting.salary_year_avg as float)) average_salary_for_skill
FROM skills_dim skills 
LEFT JOIN skills_job_dim skills_to_job ON skills.skill_id = skills_to_job.skill_id
LEFT JOIN job_postings_fact job_posting ON skills_to_job.job_id = job_posting.job_id
GROUP BY skills
ORDER BY average_salary_for_skill DESC
