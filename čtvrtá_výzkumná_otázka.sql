-- 4) Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (rozdíl > 10 %)?

WITH yearly_averages AS (
    -- první získáme průměrnou mzdu a průměrnou cenu za celou ČR pro každý rok
    SELECT 
        common_year,
        AVG(average_salary) AS avg_payroll,
        AVG(average_price) AS avg_price
    FROM t_jiri_holek_project_sql_primary_final
    GROUP BY common_year
),
yearly_growth AS (
    -- spočítáme meziroční nárůst v procentech pomocí LAG
    SELECT 
        common_year,
        ((avg_payroll - LAG(avg_payroll) OVER (ORDER BY common_year)) / LAG(avg_payroll) OVER (ORDER BY common_year) * 100) AS payroll_growth_pct,
        ((avg_price - LAG(avg_price) OVER (ORDER BY common_year)) / LAG(avg_price) OVER (ORDER BY common_year) * 100) AS price_growth_pct
    FROM yearly_averages
)
-- výpočet rozdílu mezi růstem cen a růstem mezd
SELECT 
    common_year,
    ROUND(payroll_growth_pct::numeric, 2) AS growth_wages,
    ROUND(price_growth_pct::numeric, 2) AS growth_food,
    ROUND((price_growth_pct - payroll_growth_pct)::numeric, 2) AS growth_diff
FROM yearly_growth
WHERE payroll_growth_pct IS NOT NULL
ORDER BY growth_diff DESC;
