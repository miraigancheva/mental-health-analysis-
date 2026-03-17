-- Mental Health Analysis of International Students in Japan
-- Source: Nguyen et al. (2019), Sustainability, 11(3), 878
-- https://doi.org/10.3390/su11030878

-- Mental health scores by length of stay (international students only)
-- Calculates average depression (PHQ-9), social connectedness (SCS),
-- and acculturative stress (ASISS) scores grouped by years of stay.

SELECT
    stay,
    COUNT(stay)          AS count_int,
    ROUND(AVG(todep), 2) AS average_phq,
    ROUND(AVG(tosc), 2)  AS average_scs,
    ROUND(AVG(toas), 2)  AS average_as
FROM students
WHERE inter_dom = 'Inter'
  AND stay IS NOT NULL
GROUP BY stay
ORDER BY stay DESC;
