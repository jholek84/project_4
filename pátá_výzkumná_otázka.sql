-- 5) Má výška HDP vliv na změny ve mzdách a cenách potravin? 

WITH salary_price_growth AS (
    -- výpočet průměrné mzdy a cen za ČR a jejich meziroční růst
    SELECT 
        common_year, 
  -- změněno z payroll_year na common_year
        ROUND(AVG(average_salary)) AS avg_salary,
        ROUND(AVG(average_price)::numeric, 2) AS avg_price,
        -- meziroční růst mezd
        ROUND(((AVG(average_salary) - LAG(AVG(average_salary)) OVER (ORDER BY common_year)) / 
            LAG(AVG(average_salary)) OVER (ORDER BY common_year) * 100)::numeric, 2) AS salary_growth_pct,
        -- meziroční růst cen
        ROUND(((AVG(average_price) - LAG(AVG(average_price)) OVER (ORDER BY common_year)) / 
            LAG(AVG(average_price)) OVER (ORDER BY common_year) * 100)::numeric, 2) AS price_growth_pct
    FROM t_jiri_holek_project_sql_primary_final
    GROUP BY common_year
)
SELECT 
    sp.common_year,
    sp.salary_growth_pct AS salary_growth,
    sp.price_growth_pct AS price_growth,
    sec.gdp_percentage_change AS gdp_growth
FROM salary_price_growth sp
JOIN t_jiri_holek_project_sql_secondary_final sec 
    ON sp.common_year = sec.year
WHERE sec.country = 'Czech Republic'
ORDER BY sp.common_year;
