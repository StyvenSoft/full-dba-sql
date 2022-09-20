-- Base de datos sakila
-- Seleccionar todos los campos de la tabla actor

SELECT * FROM sakila.actor;

-- actor_id, first_name, last_name, last_update

SELECT first_name FROM	sakila.actor;

-- Renombrar columnas

SELECT actor_id, first_name AS Nombre, last_name AS Apellido FROM sakila.actor;

SELECT * FROM sakila.city;

