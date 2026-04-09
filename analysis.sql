-- Total number of businesses
SELECT COUNT(*) AS total_business
FROM public.calgary_business;

-- Business status distribution
SELECT
    jobstatusdesc AS status,
    COUNT(*) AS total
FROM public.calgary_business
GROUP BY jobstatusdesc
ORDER BY total DESC;

-- Top business types
SELECT
    licencetypes,
    COUNT(*) AS total
FROM public.calgary_business
GROUP BY licencetypes
ORDER BY total DESC
LIMIT 10;

-- Top communities
SELECT
    comdistnm,
    COUNT(*) AS total
FROM public.calgary_business
GROUP BY comdistnm
ORDER BY total DESC
LIMIT 10;

-- Business growth over time
SELECT
    EXTRACT(
        YEAR FROM
        TO_DATE(first_iss_dt,'YYYY/MM/DD')
    ) AS year,
    COUNT(*) AS total
FROM public.calgary_business
WHERE first_iss_dt IS NOT NULL
GROUP BY year
ORDER BY year;
