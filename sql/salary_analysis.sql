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

-- Question 2:
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

-- Question 3:
-- Does remote work relate to salary?

SELECT
    remote_ratio,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary
FROM ai_ds_job_salaries_2026
GROUP BY remote_ratio
ORDER BY remote_ratio;

-- Question 4:
-- Does education level relate to salary?

SELECT
    education_level,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary
FROM ai_ds_job_salaries_2026
GROUP BY education_level
ORDER BY average_salary DESC;

-- Question 5:
-- Which programming languages are associated with higher salaries?

SELECT
    primary_language,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary
FROM ai_ds_job_salaries_2026
GROUP BY primary_language
ORDER BY average_salary DESC;

-- Question 6:
-- Does having ML in the job title relate to salary?

SELECT
    has_ml_in_title,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary
FROM ai_ds_job_salaries_2026
GROUP BY has_ml_in_title
ORDER BY average_salary DESC;

-- Question 7:
-- Do professionals who use AI tools daily earn more?

SELECT
    uses_ai_tools_daily,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary
FROM ai_ds_job_salaries_2026
GROUP BY uses_ai_tools_daily
ORDER BY average_salary DESC;

-- Question 8:
-- Does AI usage intensity relate to salary?

SELECT
    CASE
        WHEN ai_tools_hours_per_week < 5 THEN 'Less than 5 hours'
        WHEN ai_tools_hours_per_week < 10 THEN '5-9 hours'
        WHEN ai_tools_hours_per_week < 20 THEN '10-19 hours'
        ELSE '20+ hours'
    END AS ai_usage_group,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary
FROM ai_ds_job_salaries_2026
GROUP BY ai_usage_group
ORDER BY average_salary DESC;




