-- 1:1

SELECT * FROM users 
INNER JOIN dni;

SELECT * FROM users 
INNER JOIN dni
ON users.user_id = dni.user_id;

SELECT name, dni_number FROM users
JOIN dni
ON users.user_id = dni.user_id
ORDER BY age ASC;

-- 1:N

SELECT * FROM users
JOIN companies
ON users.company_id = companies.company_id;


SELECT * FROM companies
JOIN users
ON users.company_id = companies.company_id;

SELECT companies.name, users.name FROM companies
JOIN users
ON companies.company_id = users.company_id;

-- N:M

SELECT users.name, languages.name
FROM users_languages
JOIN users ON users_languages.user_id = users.user_id
JOIN languages ON users_languages.language_id = languages.language_id;

-- Aunque cambiemos el orden de las tablas, el resultado es el mismo, aunque podría afectar a el rendimiento,
-- pero no suele ser habitual.
SELECT users.name, languages.name
FROM users
JOIN users_languages ON users_languages.user_id = users.user_id
JOIN languages ON users_languages.language_id = languages.language_id;



