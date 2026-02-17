# Projekt číslo čtyři na téma SQL zkoumá vliv HDP na mzdy a ceny potravin v ČR (2006–2018)

Tento projekt se zabývá analýzou ekonomických dat České republiky se zaměřením na vztah mezi průměrnými mzdami, cenami základních potravin a hrubým domácím produktem (HDP).

## 🚀 Výzkumné otázky a výsledky

### 1. Rostou mzdy ve všech odvětvích, nebo v některých klesají?

### 2. Kolik litrů mléka a kg chleba lze koupit za první a poslední období?

### 3. Která kategorie potravin zdražuje nejpomaleji?

### 4. Existuje rok s rozdílem růstu cen a mezd nad 10 %?

### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? 

## Technická stránka projektu
Projekt je postaven nad databází v SQL. 
* **Primární tabulka:** `t_jiri_holek_project_sql_primary_final` (společné roky 2006–2018).
* **Sekundární tabulka:** `t_jiri_holek_project_sql_secondary_final` (data o HDP evropských států).

## Struktura repozitáře
* `README.md` - Tato dokumentace.
* `Projekt SQL odpovědi na výzkumné otázky 3` - Kompletní znění odpovědí na výzkumné otázky spolu s grafy a tabulkami.
* `tabulka_1_a_tabulka_2.sql` - SQL struktura tabulky 1 a 2.
* `první_výzkumná_otázka.sql až pátá_výzkumná_otázka.sgl` - SQL struktura dotazů do primíární a sekundární tabulky pro získání odpovědí na výzkumné otázky.
