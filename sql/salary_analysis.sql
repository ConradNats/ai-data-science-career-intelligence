-- ============================================
-- AI & Data Science Career Intelligence
-- Salary Analysis
-- ============================================

USE ai_career_intelligence;


-- 1. Average salary by experience level
SELECT
    experience_level,
    COUNT(*) AS number_of_jobs,
    ROUND(AVG(salary_usd), 2) AS average_salary
FROM ai_ds_job_salaries_2026
GROUP BY experience_level
ORDER BY average_salary DESC;

-- Question 1:
-- Does experience level affect salary?

SELECT
    experience_level,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary
FROM ai_ds_job_salaries_2026
GROUP BY experience_level
ORDER BY average_salary DESC;

- Question 2:
-- Which industries pay the highest salaries?

SELECT
    industry,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary
FROM ai_ds_job_salaries_2026
GROUP BY industry
ORDER BY average_salary DESC;