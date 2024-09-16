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
-- SELECT DISTINCT lifeexpectancy FROM country
-- where lifeexpectancy is not null
-- order by lifeexpectancy DESC;

/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/
-- SELECT distinct continent,
--        sum(population) over w1 as "continet population"
-- FROM country
-- window w1 as (PARTITION by continent);

/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

-- SELECT distinct continent,
--        sum(population) over w1 as "continet population",
--        sum(population) over () as "total",
--        round((sum(population::float) over w1)/(sum(population::float) over ()) * 100) as "percentage round",
--        (sum(population::float) over w1)/(sum(population::float) over ()) * 100 as "percentage"
-- FROM country
-- window w1 as (PARTITION by continent);

-- create index idx_countrycode
-- on city(countrycode)

EXPLAIN ANALYZE
SELECT "name", district, countrycode FROM city 
WHERE countrycode IN ('PSE', 'ZWE', 'BE')

