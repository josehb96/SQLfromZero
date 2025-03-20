SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = "Brais";

SELECT name, init_date AS 'Fecha de inicio en programación' FROM users WHERE name = 'Brais';

SELECT CONCAT(name, surname) FROM users;

SELECT CONCAT('Nombre: ', name, ' Apellidos: ', surname) FROM users;

SELECT CONCAT('Nombre: ', name, ' Apellidos: ', surname) AS "Nombre completo" FROM users;