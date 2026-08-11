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



