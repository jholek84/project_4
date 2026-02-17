-- 3a) Která kategorie potravin zdražuje nejpomaleji? (je u ní nejnižší percentuální meziroční nárůst)

SELECT 
    food_name,
    -- průměr ze všech meziročních změn cen v procentech
    ROUND(AVG(yearly_percentage_change)::numeric, 2) AS average_yearly_growth_pct
FROM (
    SELECT 
        food_name,
        common_year, -- OPRAVENO: z payroll na common
        average_price,
        -- výpočet procentuální změny ceny oproti předchozímu roku pomocí LAG
        ((average_price - LAG(average_price) OVER (PARTITION BY food_name ORDER BY common_year)) / 
        LAG(average_price) OVER (PARTITION BY food_name ORDER BY common_year) * 100) AS yearly_percentage_change
    FROM (
        -- musíme vzít unikátní záznamy potravin a let z primární tabulky
        SELECT DISTINCT 
            food_name, 
            common_year, 
            average_price 
        FROM t_jiri_holek_project_sql_primary_final
    ) sub_prices
) sub_calc
WHERE yearly_percentage_change IS NOT NULL 
-- opět odstraníme první roky (nemají srovnání z minulosti) 
GROUP BY food_name
ORDER BY average_yearly_growth_pct ASC; 
-- seřadíme od nejnižšího růstu (nejpomalejší míra zdražování)

-- 3b) Srovnání cen cukru a paprik mezi lety 2006 a 2018 (OPRAVENO: doplněn komentář)
WITH boundary_years AS (
    SELECT MIN(common_year) AS min_year, MAX(common_year) AS max_year
    FROM t_jiri_holek_project_sql_primary_final
)
SELECT 
    food_name,
    -- cena v prvním roce
    MAX(CASE WHEN common_year = (SELECT min_year FROM boundary_years) THEN average_price END) AS price_2006,
    -- cena v posledním roce
    MAX(CASE WHEN common_year = (SELECT max_year FROM boundary_years) THEN average_price END) AS price_2018,
    -- celkový rozdíl v korunách
    MAX(CASE WHEN common_year = (SELECT max_year FROM boundary_years) THEN average_price END) - 
    MAX(CASE WHEN common_year = (SELECT min_year FROM boundary_years) THEN average_price END) AS diff_czk,
    -- procentuální změna
    ROUND(
        ((MAX(CASE WHEN common_year = (SELECT max_year FROM boundary_years) THEN average_price END) / 
        MAX(CASE WHEN common_year = (SELECT min_year FROM boundary_years) THEN average_price END) - 1) * 100)::numeric, 2
    ) AS diff_percentage
FROM t_jiri_holek_project_sql_primary_final
WHERE (food_name LIKE '%Cukr%' OR food_name LIKE '%Papriky%')
GROUP BY food_name;
