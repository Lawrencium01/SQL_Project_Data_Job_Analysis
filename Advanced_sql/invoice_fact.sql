SELECT 
	project_company,
	nerd_id,
	nerd_role,
	hours_spent,
	hours_rate AS rate_original,
	hours_rate + 5 AS rate_hike,
	(hours_rate + 5) * hours_spent AS project_total
FROM result_set
WHERE (hours_rate + 5) * hours_spent > 1000

SELECT 
	activity_id,
	hours_spent,
	CAST(hours_spent AS int) % 8 AS extra_hours
FROM result_set
WHERE (hours_spent BETWEEN 8 AND 16) AND
		(CAST(hours_spent AS int) % 8) > 0
ORDER BY hours_spent


--Practice Problem 3
SELECT 
	project_id,
	--hours_spent,
	--hours_rate AS rate_original,
	SUM(hours_spent * hours_rate) project_original_cost,
	--hours_rate + 5 AS rate_hike,
	SUM(hours_spent * (hours_rate + 5)) project_projected_cost
FROM result_set
GROUP BY project_id
ORDER BY project_id