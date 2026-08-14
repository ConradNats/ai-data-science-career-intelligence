-- =====================================================
-- AI & DATA SCIENCE CAREER INTELLIGENCE
-- JOB SWITCHING ANALYSIS
-- =====================================================

USE ai_career_intelligence;

-- Question 1:
-- What percentage of professionals switched jobs last year?

SELECT
    switched_jobs_last_year,
    COUNT(*) AS number_of_professionals,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM ai_ds_job_salaries_2026),
        2
    ) AS percentage_of_professionals
FROM ai_ds_job_salaries_2026
GROUP BY switched_jobs_last_year
ORDER BY number_of_professionals DESC;


-- Question 2:
-- Do professionals who switched jobs earn more?

SELECT
    switched_jobs_last_year,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(salary_usd), 2) AS average_salary,
    ROUND(AVG(years_experience), 2) AS average_experience
FROM ai_ds_job_salaries_2026
GROUP BY switched_jobs_last_year
ORDER BY average_salary DESC;

-- Question 3:
-- Does job satisfaction relate to job switching?

SELECT
    switched_jobs_last_year,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(job_satisfaction_score), 2) AS average_job_satisfaction,
    ROUND(AVG(fears_ai_automation_score), 2) AS average_ai_fear
FROM ai_ds_job_salaries_2026
GROUP BY switched_jobs_last_year
ORDER BY average_job_satisfaction DESC;

-- Question 4:
-- Which experience levels have the highest job-switching rates?

SELECT
    experience_level,
    COUNT(*) AS total_professionals,
    SUM(
        CASE
            WHEN switched_jobs_last_year = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS job_switchers,
    ROUND(
        SUM(
            CASE
                WHEN switched_jobs_last_year = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS switching_rate
FROM ai_ds_job_salaries_2026
GROUP BY experience_level
ORDER BY switching_rate DESC;

-- Question 5:
-- Does daily AI usage relate to job switching?

SELECT
    uses_ai_tools_daily,
    COUNT(*) AS total_professionals,
    SUM(
        CASE
            WHEN switched_jobs_last_year = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS job_switchers,
    ROUND(
        SUM(
            CASE
                WHEN switched_jobs_last_year = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS switching_rate
FROM ai_ds_job_salaries_2026
GROUP BY uses_ai_tools_daily
ORDER BY switching_rate DESC;

-- Question 6:
-- Which industries have the highest job-switching rates?

SELECT
    industry,
    COUNT(*) AS total_professionals,
    SUM(
        CASE
            WHEN switched_jobs_last_year = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS job_switchers,
    ROUND(
        SUM(
            CASE
                WHEN switched_jobs_last_year = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS switching_rate
FROM ai_ds_job_salaries_2026
GROUP BY industry
ORDER BY switching_rate DESC;

-- Question 8:
-- Which education levels have the highest job satisfaction?

SELECT
    education_level,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(job_satisfaction_score), 2) AS average_job_satisfaction,
    ROUND(AVG(salary_usd), 2) AS average_salary
FROM ai_ds_job_salaries_2026
GROUP BY education_level
ORDER BY average_job_satisfaction DESC;


