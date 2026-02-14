První oprava projektu

Cíle projektu v SQL: Cíl projektu byl vytvořit podklady pro odpovědi pěti výzkumných otázek týkajících se dostupnosti základních potravin ve vztahu k cenám a HDP.

V souboru tabulka_1_a_tabulka_2 jsou SQL skripty pro tvorbu dvou základních tabulek. Z nich se poté čerpaly podklady pro odpovědi výzkumných otázek.

SQL skripty použité pro zodpovězené jednotlivých otázek jsou pro každou otázku samostatně.

Jednotlivé výzkumné otázky byly:

1)Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

2)Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

3)Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší procentuální meziroční nárůst)?

4)Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

5)Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Co by šlo vylepšit:
Primární tabulka: dle zadání máte vytvořit tabulku omezenou společnými roky tabulek czechia_price a czechia_payroll.
odpovědi_na_výzkumné_otázky: Tento soubor je v repozitáři zbytečný.
Odpověď na první otázku: Tohle by bylo fajn trochu rozepsat slovně, analyzovat získaná data, třeba v jakém odvětví došlo k poklesu nejvíckrát, jaký rok byl nejhorší atd. Graf může být jen přidán jako doplněk.
Obecně: ukládat dotazy s příponou .sql.
druhá_výzkumná_otázka: Dotaz nic nevrací. Může za to špatné omezení roků v primární tabulce.
Odpověď na druhou otázku: Výsledky interpretuješ bohužel špatně. Říkáš, že za 20000 korun se dá koupit 1,46 litrů mléka. DBeaver čárkou odděluje tisíce.
Odpověď na třetí otázku: Tady by bylo dobré v odpovědi přímo uvést data, tedy o kolik zdražily papriky / zlevnil cukr. Trochu odpověď zhodnotit.
Odpověď na čtvrtou otázku:Tvoje odpověď neodpovídá na otázku. Ptáme se, kde byl růst výrazně vyšší (10 %).
Projekt SQL odpovědi na výzkumné otázky.pdf: Mělo by být ve formátu .md.
