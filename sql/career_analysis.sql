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

    