SELECT count(*) FROM countrylanguage WHERE isofficial = TRUE;
SELECT avg(lifeexpectancy) FROM country;
SELECT avg(population) FROM city WHERE countrycode = 'NLD'