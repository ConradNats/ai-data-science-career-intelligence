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







