-- 1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
-- Tabulka zobrazí přehled meziročních změn pro každé odvětví.

SELECT 
    industry_name,
    common_year, -- OPRAVENO z payroll na common
    average_salary,
    prev_year_salary,
    -- Výpočet rozdílu v korunách
    ROUND(average_salary - prev_year_salary, 2) AS salary_diff,
    -- Výpočet procentuálního růstu/poklesu
    ROUND(((average_salary - prev_year_salary) / prev_year_salary * 100)::numeric, 2) AS growth_percentage
FROM (
    -- Specifikace unikátní mzdy pro každé odvětví a rok a hodnoty z předchozího roku
    SELECT 
        industry_name,
        common_year,
        average_salary,
        LAG(average_salary) OVER (PARTITION BY industry_name ORDER BY common_year) AS prev_year_salary
    FROM (
        -- Příkaz DISTINCT, protože v primární tabulce jsou data znásobená
        SELECT DISTINCT 
            industry_name, 
            common_year, 
            average_salary 
        FROM t_jiri_holek_project_sql_primary_final
    ) sub_distinct
) sub_lag
WHERE prev_year_salary IS NOT NULL 
-- Odstraní první roky, které nelze s ničím porovnat
ORDER BY growth_percentage ASC; 
-- Seřadí od největších poklesů po největší růsty
