-- =====================================================
-- AI & DATA SCIENCE CAREER INTELLIGENCE
-- AI ADOPTION ANALYSIS
-- =====================================================

USE ai_career_intelligence;


-- Question 1:
-- What percentage of professionals use AI tools daily?

SELECT
    uses_ai_tools_daily,
    COUNT(*) AS number_of_professionals,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ai_ds_job_salaries_2026),
        2
    ) AS percentage_of_professionals
FROM ai_ds_job_salaries_2026
GROUP BY uses_ai_tools_daily
ORDER BY number_of_professionals DESC;



-- Question 2:
-- Which industries have the highest AI adoption?

SELECT
    industry,
    COUNT(*) AS total_professionals,
    SUM(
        CASE
            WHEN uses_ai_tools_daily = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS daily_ai_users,
    ROUND(
        SUM(
            CASE
                WHEN uses_ai_tools_daily = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS daily_ai_adoption_rate
FROM ai_ds_job_salaries_2026
GROUP BY industry
ORDER BY daily_ai_adoption_rate DESC;



-- Question 3:
-- Which experience levels have the highest AI adoption?

SELECT
    experience_level,
    COUNT(*) AS total_professionals,
    SUM(
        CASE
            WHEN uses_ai_tools_daily = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS daily_ai_users,
    ROUND(
        SUM(
            CASE
                WHEN uses_ai_tools_daily = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS daily_ai_adoption_rate
FROM ai_ds_job_salaries_2026
GROUP BY experience_level
ORDER BY daily_ai_adoption_rate DESC;



-- Question 4:
-- Which education groups have the highest AI adoption?

SELECT
    education_level,
    COUNT(*) AS total_professionals,
    SUM(
        CASE
            WHEN uses_ai_tools_daily = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS daily_ai_users,
    ROUND(
        SUM(
            CASE
                WHEN uses_ai_tools_daily = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS daily_ai_adoption_rate
FROM ai_ds_job_salaries_2026
GROUP BY education_level
ORDER BY daily_ai_adoption_rate DESC;



-- Question 5:
-- Does daily AI usage relate to job satisfaction?

SELECT
    uses_ai_tools_daily,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(job_satisfaction_score), 2) AS average_job_satisfaction,
    ROUND(MIN(job_satisfaction_score), 2) AS minimum_satisfaction,
    ROUND(MAX(job_satisfaction_score), 2) AS maximum_satisfaction
FROM ai_ds_job_salaries_2026
GROUP BY uses_ai_tools_daily
ORDER BY average_job_satisfaction DESC;



-- Question 6:
-- Does AI usage relate to fear of AI automation?

SELECT
    uses_ai_tools_daily,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(fears_ai_automation_score), 2) AS average_ai_fear,
    ROUND(MIN(fears_ai_automation_score), 2) AS minimum_ai_fear,
    ROUND(MAX(fears_ai_automation_score), 2) AS maximum_ai_fear
FROM ai_ds_job_salaries_2026
GROUP BY uses_ai_tools_daily
ORDER BY average_ai_fear DESC;



-- Question 7:
-- How does weekly AI-tool usage differ by experience level?

SELECT
    experience_level,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(ai_tools_hours_per_week), 2) AS average_ai_hours_per_week,
    ROUND(MIN(ai_tools_hours_per_week), 2) AS minimum_ai_hours,
    ROUND(MAX(ai_tools_hours_per_week), 2) AS maximum_ai_hours
FROM ai_ds_job_salaries_2026
GROUP BY experience_level
ORDER BY average_ai_hours_per_week DESC;



-- Question 8:
-- Which industries spend the most time using AI tools?

SELECT
    industry,
    COUNT(*) AS number_of_professionals,
    ROUND(AVG(ai_tools_hours_per_week), 2) AS average_ai_hours_per_week,
    ROUND(MIN(ai_tools_hours_per_week), 2) AS minimum_ai_hours,
    ROUND(MAX(ai_tools_hours_per_week), 2) AS maximum_ai_hours
FROM ai_ds_job_salaries_2026
GROUP BY industry
ORDER BY average_ai_hours_per_week DESC;