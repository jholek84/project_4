
-- první smažu tabulku, abych mohl začít znovu
DROP TABLE IF EXISTS t_jiri_holek_project_sql_primary_final;

-- potom vytvořím novou tabulku, kde budou jen společné roky 2006 až 2018
CREATE TABLE t_jiri_holek_project_sql_primary_final AS
SELECT 
    cp.payroll_year AS common_year,
    cpib.name AS industry_name,
    ROUND(AVG(cp.value)::numeric, 2) AS average_salary,
    cpc.name AS food_name,
    ROUND(AVG(cpr.value)::numeric, 2) AS average_price
FROM czechia_payroll cp
JOIN czechia_payroll_industry_branch cpib 
    ON cp.industry_branch_code = cpib.code
JOIN czechia_price cpr 
    ON cp.payroll_year = EXTRACT(YEAR FROM cpr.date_from)
JOIN czechia_price_category cpc 
    ON cpr.category_code = cpc.code
WHERE cp.value_type_code = 5958 
  AND cp.calculation_code = 200
  -- Tady omezím roky tak, aby byly v obou tabulkách
  AND cp.payroll_year IN (SELECT DISTINCT payroll_year FROM czechia_payroll)
  AND cp.payroll_year IN (SELECT DISTINCT EXTRACT(YEAR FROM date_from) FROM czechia_price)
GROUP BY 
    cp.payroll_year, 
    cpib.name, 
    cpc.name;

-- a ověřím, že všechny roky obsahují podobné množství dat
SELECT common_year, count(*) 
FROM t_jiri_holek_project_sql_primary_final 
GROUP BY common_year 
ORDER BY common_year;

DROP TABLE IF EXISTS t_jiri_holek_project_sql_secondary_final;

CREATE TABLE t_jiri_holek_project_sql_secondary_final AS 
SELECT
    e.country,
    e.year,
    e.gdp,
    e.gini, 
-- Gini koeficient je použit na základě zadání
    e.population,
-- Výpočet meziroční změny HDP v procentech pro každý stát zvlášť
    ROUND(
        ((e.gdp - LAG(e.gdp) OVER (PARTITION BY e.country ORDER BY e.year)) / 
        LAG(e.gdp) OVER (PARTITION BY e.country ORDER BY e.year) * 100)::numeric, 
    2) AS gdp_percentage_change
FROM
    economies e
JOIN countries c 
    ON e.country = c.country
WHERE 
    c.continent = 'Europe' 
-- V zadání se uvádí použít pro Evropské státy
    AND e.year BETWEEN 2006 AND 2018 
-- Období odpovídající primární tabulce
ORDER BY
    e.country, e.year;
