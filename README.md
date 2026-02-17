# Projekt číslo čtyři na téma SQL zkoumá vliv HDP na mzdy a ceny potravin v ČR (2006–2018)

Tento projekt se zabývá analýzou ekonomických dat České republiky se zaměřením na vztah mezi průměrnými mzdami, cenami základních potravin a hrubým domácím produktem (HDP). Projekt je postaven na databázi SQL.

## Datové sady, které je možné použít pro získání vhodného datového podkladu
### Primární tabulky:
* czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
* czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
* czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
* czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
* czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
* czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
* czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

### Číselníky sdílených informací o ČR:
* czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
* czechia_district – Číselník okresů České republiky dle normy LAU.

### Dodatečné tabulky:
* countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
* economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

## Vznikly dvě cílové tabulky
* t_jiri_holek_project_SQL_primary_final: tabulka primárně obsahuje data mezd a cen potravin za Českou republiku sjednocených za srovnatelné období - roky
* t_jiri_holek_project_SQL_secondary_final: tabulka obsahuje data o evropských státech.


##  Výzkumné otázky a výsledky

### 1. Rostou mzdy ve všech odvětvích, nebo v některých klesají?
V letech 2006 až 2018 mzdy rostly i klesaly napříč všemi odvětvími. Ovšem v celkovém období mzdy jednoznačně rostly. Průměrný meziroční nárůst se pohybuje nejčastěji mezi 
**3 % až 6 %**. Existují však specifické odvětví, kde tento trend neplatí.

**Nejhorším rokem byl rok 2013**. V tomto roce došlo dokonce k poklesu reálných mezd u necelé poloviny odvětví. V oblasti **těžby nerostných surovin a dobývání**, došlo k poklesu několik let za sebou. Bylo to mezi lety 2013 až 2016. Také v odvětví **ubytování, stravování a pohostinství** došlo v roce 2013 k poklesu. Tahouni ekonomiky v těchto slabých letech byly odvětví **peněžnictví a pojišťovnictví a také informačních a komunikačních technologií**.

### 2. Kolik litrů mléka a kg chleba lze koupit za první a poslední období?

Z dat kupní síly na začátku a na konci daného období (roky 2006 a 2018) je patrný pozitivní vývoj. I když se potraviny zdražovaly rostly také výrazně mzdy.
V případě chleba si mohl občan koupit **v roce 2018 o 63 kg chleba více než v roce 2006.
U mléka si mohl dokonce dovolit o 213 litrů mléka více.**

### 3. Která kategorie potravin zdražuje nejpomaleji?

**3a)** 

Největší míra zdražení se udála u paprik, na druhou stranu nejvíce zlevnil cukr krystal.
**Cukr krystal** byl potravinou s nejvýraznějším poklesem ceny.  Pokud porovnáme absolutní data, v roce 2006 stál cca 22,30 Kč, zatímco v roce 2018 klesl na průměrných 15,70 Kč. 
Za sledované období klesla jeho cena celkem o 6,60 Kč za kilogram.

**3b)**

**Papriky** naopak zdražily nejvíce. Kilo paprik stálo v průměru v roce 2006 35,31Kč. V roce 2018 už byla jejich cena o 25,16 Kč za kilogram vyšší. Kilo paprik tak v roce 2018 vyšlo na 60,47 Kč.

### 4. Existuje rok s rozdílem růstu cen a mezd nad 10 %?

Na základě provedené analýzy dat za období 2006 – 2018 **neexistuje žádný rok, ve kterém by byl nárůst cen potravin o 10 % vyšší než nárůst mezd.**
Nejvýraznější rozdíl nastal v roce 2013, kdy ceny potravin vzrostly meziročně o 5,10 %, zatímco mzdy klesly o 1,56%. **Celkový rozdíl zdražení činil 6,65%.**

### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? 

**Ano má**. Většinou se změnou DPH došlo  ještě v daném roce ke změně mezd a spotřebních cen zboží a potravin. Příkladem je rok 2007 kdy se o 5,57% zvýšila DPH a na to zareagovaly ceny i mzdy růstem o necelých 7%. 
Naopak v roce recese 2009 pokleslo DPH o 4,66%, což se ještě ve stejném roce projevilo v poklesu cen zboží a potravin o 6,42% a zpomalení růstu mezd.

## Struktura repozitáře
* `README.md` - Tato dokumentace včetně výzkumných otázek a odpovědí na ně.
* `tabulka_1_a_tabulka_2.sql` - SQL struktura primární a sekundární tabulky.
* `první_výzkumná_otázka.sql až pátá_výzkumná_otázka.sgl` - SQL struktura dotazů do primíární a sekundární tabulky pro získání odpovědí na výzkumné otázky.

* `README.md` - Tato dokumentace.
* `holek_jiri_SQL_queries.sql` - Kompletní SQL skript pro výpočet všech otázek.
