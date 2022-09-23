-- Ordenar colunma de forma descendente

SELECT * FROM sakila.country ORDER BY country DESC;

-- Ordenar ascendente

SELECT * FROM sakila.country ORDER BY country ASC;

SELECT * FROM sakila.customer ORDER BY first_name ASC;

-- WHERE

SELECT * FROM sakila.actor WHERE first_name = 'DAN';

SELECT * FROM sakila.city WHERE city = 'Londo';

SELECT * FROM sakila.city WHERE country_id = 102;

SELECT * FROM sakila.customer WHERE store_id = 1;

SELECT * FROM sakila.inventory WHERE film_id > 50;

SELECT DISTINCT amount FROM sakila.payment WHERE amount < 3;

-- diferente <>

SELECT * FROM sakila.staff WHERE staff_id <> 2


SELECT * FROM sakila.language WHERE name <> 'German';

SELECT * FROM sakila.country WHERE country = 'Algeria' AND country_id = 2;

