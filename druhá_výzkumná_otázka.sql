-- 2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období?

-- zjistíme, jaký je první a poslední rok, kde máme data pro mzdy i ceny
WITH boundary_years AS (
    SELECT 
        MIN(common_year) AS min_year, 
        MAX(common_year) AS max_year
    FROM t_jiri_holek_project_sql_primary_final
)
-- vypočítáme průměrnou mzdu a průměrnou cenu pro tyto dva roky
SELECT 
    common_year,
    food_name,
    -- průměrná mzda v ČR (přes všechna odvětví)
    ROUND(AVG(average_salary)) AS avg_salary,
    -- průměrná cena dané potraviny
    ROUND(AVG(average_price), 2) AS avg_price,
    -- výpočet: mzda dělená cenou (celé jednotky)
    FLOOR(AVG(average_salary) / AVG(average_price)) AS affordable_units
FROM t_jiri_holek_project_sql_primary_final
WHERE 
    -- chceme pouze chleba a mléko
    (food_name LIKE '%Chléb%' OR food_name LIKE '%Mléko%')
    -- chceme jen ty dva hraniční roky (2006 a 2018)
    AND common_year IN (SELECT min_year FROM boundary_years UNION SELECT max_year FROM boundary_years)
GROUP BY 
    common_year, 
    food_name
ORDER BY 
    food_name, 
    common_year;
