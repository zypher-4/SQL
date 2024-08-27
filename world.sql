-- SELECT count(*) from countrylanguage WHERE isofficial = true;
-- SELECT avg(lifeexpectancy) from country;
-- SELECT avg(population) from city WHERE countrycode = 'NLD'

/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/
-- SELECT count(*) as "Number of Cities" FROM city
-- where district in ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/
SELECT DISTINCT lifeexpectancy FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy DESC;