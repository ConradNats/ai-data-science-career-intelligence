-- =====================================================
-- AI & DATA SCIENCE CAREER INTELLIGENCE
-- CAREER ANALYSIS
-- =====================================================

USE ai_career_intelligence;

-- Question 1:
-- How does salary vary across experience bands?

SELECT
    CASE
        WHEN years_experience < 3 THEN '0-2 years'
        WHEN years_experience < 6 THEN '3-5 years'
        WHEN years_experience < 11 THEN '6-10 years'
        WHEN years_experience < 16 THEN '11-15 years'
        ELSE '16+ years'
    END AS experience_band,

    COUNT(*) AS number_of_professionals,

    ROUND(AVG(salary_usd), 2) AS average_salary,

    MIN(salary_usd) AS minimum_salary,

    MAX(salary_usd) AS maximum_salary

FROM ai_ds_job_salaries_2026

GROUP BY experience_band

ORDER BY
    CASE
        WHEN experience_band = '0-2 years' THEN 1
        WHEN experience_band = '3-5 years' THEN 2
        WHEN experience_band = '6-10 years' THEN 3
        WHEN experience_band = '11-15 years' THEN 4
        ELSE 5
    END;

-- Question 2:
-- How does salary vary by number of certifications?

SELECT
    CASE
        WHEN certifications_count = 0 THEN '0 certifications'
        WHEN certifications_count = 1 THEN '1 certification'
        WHEN certifications_count = 2 THEN '2 certifications'
        WHEN certifications_count = 3 THEN '3 certifications'
        ELSE '4+ certifications'
    END AS certification_group,

    COUNT(*) AS number_of_professionals,

    ROUND(AVG(salary_usd), 2) AS average_salary

FROM ai_ds_job_salaries_2026

GROUP BY certification_group

ORDER BY
    CASE
        WHEN certification_group = '0 certifications' THEN 1
        WHEN certification_group = '1 certification' THEN 2
        WHEN certification_group = '2 certifications' THEN 3
        WHEN certification_group = '3 certifications' THEN 4
        ELSE 5
    END;

-- Question 4:
-- Do professionals who manage people earn more?

SELECT
    manages_people,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    ROUND(AVG(team_size), 2) AS average_team_size
FROM ai_ds_job_salaries_2026
GROUP BY manages_people
ORDER BY average_salary DESC;

-- Question 5:
-- How does salary vary by team size?

SELECT
    CASE
        WHEN team_size <= 5 THEN '1-5 people'
        WHEN team_size <= 10 THEN '6-10 people'
        WHEN team_size <= 15 THEN '11-15 people'
        ELSE '16+ people'
    END AS team_size_group,

    COUNT(*) AS number_of_professionals,

    ROUND(AVG(salary_usd), 2) AS average_salary,

    ROUND(AVG(job_satisfaction_score), 2) AS average_job_satisfaction

FROM ai_ds_job_salaries_2026

GROUP BY team_size_group

ORDER BY
    CASE
        WHEN team_size_group <= 5 THEN 1
        WHEN team_size_group <= 10 THEN 2
        WHEN team_size_group <= 15 THEN 3
        ELSE 4
    END;

-- Question 6:
-- Does remote work relate to job satisfaction?

SELECT
    CASE
        WHEN remote_ratio = 0 THEN 'On-site'
        WHEN remote_ratio = 50 THEN 'Hybrid'
        ELSE 'Fully remote'
    END AS work_arrangement,

    COUNT(*) AS number_of_professionals,

    ROUND(AVG(job_satisfaction_score), 2) AS average_job_satisfaction,

    ROUND(AVG(salary_usd), 2) AS average_salary

FROM ai_ds_job_salaries_2026

GROUP BY
    work_arrangement

ORDER BY
    CASE
        WHEN work_arrangement = 'On-site' THEN 1
        WHEN work_arrangement = 'Hybrid' THEN 2
        ELSE 3
    END;

    

