# Curso de SQL y Bases de datos

## 1. Bases de datos SQL

- SQL es un lenguaje de consulta
- SQL → Structure Query Language

SQL es un estándar ANSI desde el año 1986 y un estándar ISO desde el año 1987.

Base de datos **relacional (SQL)**:

Un lugar donde están guardados los datos, pero esos datos, es decir, esas tablas que podemos tener guardan relaciones entre sí y pueden tener dependencias una de la otra.

Base de datos **no relacional (NoSQL)**:

En esta en cambio, todos estos datos son independientes, es decir, nosotros tendremos por un lado el esquema de Netflix por ejemplo, pero después tendremos el documento de usuarios y el documento de las películas. Pero inicialmente no está pensado para que nosotros podamos relacionar muy rápidamente la tabla de usuarios con la tabla de películas.

Cada tipo de base de datos está enfocado en lo suyo, es decir, si tenemos datos que se tienen que relacionar de forma profunda, entonces base de datos relacional, en cambio si tenemos datos a los cuales queremos acceder rápidamente pero que no queremos relacionarlos con otras entidades, entonces base de datos no relacional.

Aún así no tenemos porque elegir una u otra, ya que en empresas de gran tamaño se usan ambos tipos guardando unas cosas en una y otras cosas en la otra.

## 2. Sistema de gestión de base de datos (DBMS)

DBMS → DataBase Management System

Los principales sistemas de gestión de bases de datos son:

- Oracle DB
- IBM Db2
- SQLite (Este es bastante simple, para proyectos supergrandes no se utiliza tanto, pero para aprender o proyectos modestos nos puede servir de sobra)
- MariaDB (Open Source)
- SQL Server (La de Microsoft)
- PostgreSQL (Open Source y probablemente la opción más popular de la actualidad)
- MySQL (Esta también es de ORACLE y también tiene un parte privativa, pero también tiene otra parte que la podemos usar en su versión Community)

Donde esté el estándar ISO/IEC 9075-1 da igual qué gestor de bases de datos usemos, por lo que la gran mayoría de los mecanismos son los del estándar.

## 3. Fundamentos de SLQ y bases de datos

Una de las mejores páginas para aprender fundamentos a nivel de desarrollo de software es w3schools. Y según Brais es una de las mejores referencias que podemos consultar para aprender las bases de SQL.

Si pensamos en un lenguaje orientado a objetos, que está dividido por clases, donde cada clase nos especifica que está modelando o qué está representando. Aquí tenemos el concepto de “Entidad”.

Una base de datos está compuesta por tablas.

Existen las relaciones uno a uno (1:1), uno a muchos (1:n), muchos a muchos (n:n). 

El estándar de base de datos relacional y el estándar de SQL nos permite trabajar con varios tipos de datos.

En los diferentes gestores de bases de datos se pueden encontrar subtipos o nuevos tipos personalizados, pero aquí nos vamos a quedar con los estándares.

Para consultarlos en profundidad: [https://www.w3schools.com/sql/sql_datatypes.asp](https://www.w3schools.com/sql/sql_datatypes.asp)

## 4. Configuración e instalación

Vamos a trabajar con RDBMS que básicamente es un gestor de bases de datos relacional. Concretamente con MySQL.

En este caso, como voy a trabajar en Kubuntu 24.10, voy a seguir las instrucciones de instalación de la página oficial de documentación de Ubuntu: [https://documentation.ubuntu.com/server/how-to/databases/install-mysql/](https://documentation.ubuntu.com/server/how-to/databases/install-mysql/)

Hacemos **sudo apt install mysql-server**

Comprobamos si el servicio mysql está funcionando:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image.png)

Comprobamos la versión de mysql instalada:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%201.png)

## 5. Primeros pasos

Con todo esto ya podemos interactuar con una base de datos.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%202.png)

¿Podemos manejar una base de datos sólo con comados?

Sí.

¿Es recomendable?

Sólo si somos muy pros o si tenemos que hacer algo muy concreto igual que desde una herramienta o interfaz gráfica quizás no somos capaces de resolver tan fácil.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%203.png)

Como se puede ver, mysql ya tiene 4 bases de datos instaladas por defecto.

Con **exit** podemos salir del terminal.

## 6. Conexión y cliente SQL

Existen infinidad de aplicaciones para interactuar con la base de datos, por ejemplo:

- DbVisualizer
- phpMyAdmin
- dbForge
- SQLPro Studio
- TablePlus

Para el curso vamos a utilizar la herramienta de bases de datos propia de la gente que está desarrollando mysql: https://dev.mysql.com/downloads/workbench

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%204.png)

Pero al tratar de conectarme me surgió este error (Estaba usando Kubuntu 24.10)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%205.png)

Y al parecer (según ChatGPT), Ubuntu en algunas versiones, configura MySQL para que el usuario **root** use **auth_socket**, lo que significa que solo puedo identificarse desde la terminal con **sudo**.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%206.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%207.png)

Ahora si volvemos a intentar realizar la conexión:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%208.png)

Creamos una nueva base de datos o esquema de base de datos llamado hello_mysql:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%209.png)

## 7. Inicialización de datos

Creamos una nueva conexión que nos dirija directamente a la base de datos que acabamos de crear:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2010.png)

Y ya la tenemos disponible:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2011.png)

Usamos esta nueva conexión y creamos una nueva tabla en “hello_mysql”. usando la interfaz gráfica.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2012.png)

Nota: El tipo de dato “date” representa una fecha sin hora

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2013.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2014.png)

Si nos fijamos en los iconos, vemos una “i” que sirve para ver la información de la tabla, una “llave” que sirve para modificar directamente desde la interfaz dicha tabla y el icono de la derecha sirve para consultar el contenido de dicha tabla.

Nota: El formato estándar para las fechas en SQL es: yyyy-mm-dd

Nota: El auto increment incrementa a partir del último identificador que nosotros teníamos.

Rellenamos la tabla usando la interfaz:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2015.png)

## 8. Consulta de datos: SELECT

<aside>
💡

Por convención en SQL las palabras reservadas del lenguaje se escriben en mayúscula

</aside>

Las sentencias SQL sirven para trabajar con lo que tenemos en la base de datos.

```sql
SELECT * FROM users;

SELECT name FROM users;

SELECT user_id, name FROM users;
```

## 9. Modificadores: Parte 1

### 9.1 DISTINCT

<aside>
💡

Si nos surge algún error al ejecutar un comando SQL, podemos copiar el código de error y buscarlo en Google.

</aside>

Con DISTINCT le indicamos a SQL que sólo muestre aquellos campos que sean distintos.

```sql
SELECT DISTINCT age from users;

SELECT DISTINCT name from users;
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2016.png)

Como se puede ver a pesar de que teníamos 2 users con la misma edad, no nos muestra el 15 dos veces, ya que únicamente muestra resultados que sean distintos.

### 9.2 WHERE

Con el WHERE estamos limitando cuál es el criterio de los datos que nosotros queremos recuperar.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2017.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2018.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2019.png)

```sql
SELECT * FROM users WHERE age = 15;

SELECT name FROM users WHERE age = 15;

SELECT DISTINCT age FROM users WHERE age = 15;
```

### 9.3 ORDER BY

ORDER BY nos permite ordenar los resultados.

<aside>
💡

Por defecto se aplica el orden ASCENDENTE

</aside>

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2020.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2021.png)

Vamos a añadir el mismo email de Sara a Carlos Azaustre:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2022.png)

Por lo tanto si lanzamos esta consulta:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2023.png)

```sql
SELECT * FROM users ORDER BY age;

SELECT * FROM users ORDER BY age ASC;

SELECT * FROM users ORDER BY age DESC;

SELECT * FROM users WHERE email='sara@gmail.com' ORDER BY age DESC;

SELECT name FROM users WHERE email='sara@gmail.com' ORDER BY age DESC;
```

### 9.4 LIKE

Modificamos el email de Miriam para que sea un gmail:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2024.png)

El comando LIKE nos sirve para definir una especie de contiene o se parece a, donde no tenemos el valor final.

<aside>
💡

LIKE se usa siempre con WHERE

</aside>

<aside>
💡

El “%” significa que antes de él en la cadena de texto nos vale cualquier cosa.

</aside>

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2025.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2026.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2027.png)

```sql
SELECT * FROM users WHERE email LIKE '%gmail.com';

SELECT * FROM users WHERE email LIKE 'sara%';

SELECT * FROM users WHERE email LIKE '%@%';
```

### 9.5 AND, OR, NOT

Si queremos consultar aquellos usuarios cuyo email no se “sara@gmail.com”:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2028.png)

Añadiendo la condición AND para que sólo muestre los que tengan dicho email y cuya edad sea 15 años:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2029.png)

Y si queremos consultar aquellos usuarios que cumplan una u otra condición, o ambas, entonces usamos OR:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2030.png)

```sql
SELECT * FROM users WHERE NOT email = 'sara@gmail.com';

SELECT * FROM users WHERE NOT email = 'sara@gmail.com' AND age = 15;

SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15;
```

### 9.6 LIMIT

LIMIT sirve para limitar el número de resultados que nos va a mostrar la consulta.

Un par de ejemplos:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2031.png)

Esto sirve para casos donde la base de datos tiene una gran cantidad de datos (por ejemplo millones de usuarios) y queremos realizar una consulta, dado que de ser así, tardaría mucho en realizar la consulta.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2032.png)

```sql
SELECT * FROM users LIMIT 3;

SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15 LIMIT 2;
```

## 10. Modificadores: Parte 2

### 10.1 Comentarios

```sql
-- Comentario en una línea

/*
Este
es
un
comentario
multilínea
*/
```

### 10.2 NULL

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2033.png)

```sql
SELECT * FROM users WHERE email IS NULL; 

SELECT * FROM users WHERE email IS NOT NULL; 

SELECT * FROM users WHERE email IS NOT NULL AND age = 15; 
```

### 10.3 MIN, MAX

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2034.png)

```sql
SELECT MAX(age) FROM users;

SELECT MIN(age) FROM users;
```

### 10.4 COUNT

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2035.png)

```sql
SELECT COUNT(*) FROM users;

SELECT COUNT(age) FROM users;
```

### 10.5 SUM

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2036.png)

```sql
SELECT SUM(age) FROM users;
```

### 10.6 AVG

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2037.png)

```sql
SELECT AVG(age) FROM users;
```

### 10.7 IN

El comando IN es capaz de hacer un filtrado en el que nosotros conocemos cuáles son precisamente los datos por los que hay que filtrar. Es una especie de límite basado en uno o varios elementos que nosotros conocemos.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2038.png)

```sql
SELECT * FROM users WHERE name IN ('brais', 'sara');
```

### 10.8 BETWEEN

Este comando nos sirve para encontrar resultados que se comprenden entre 2 valores, un valor mínimo y un valor máximo. 

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2039.png)

```sql
SELECT * FROM users WHERE age BETWEEN 20 AND 30;
```

### 10.9 ALIAS

<aside>
💡

En SQL podemos usar tanto comillas simples como dobles.

</aside>

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2040.png)

```sql
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = "Brais";

SELECT name, init_date AS 'Fecha de inicio en programación' FROM users WHERE name = 'Brais';
```

### 10.10 CONCAT

Existe una ligera variación dentro de ALIAS que nos permite concatenar cadenas, que nos permite concatenar atributos, que nos permite concatenar columnas.

Por ejemplo, ¿Cómo podríamos concatenar en una misma columna el nombre y el apellido?

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2041.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2042.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2043.png)

```sql
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = "Brais";

SELECT name, init_date AS 'Fecha de inicio en programación' FROM users WHERE name = 'Brais';

SELECT CONCAT(name, surname) FROM users;

SELECT CONCAT('Nombre: ', name, ' Apellidos: ', surname) FROM users;

SELECT CONCAT('Nombre: ', name, ' Apellidos: ', surname) AS "Nombre completo" FROM users;
```

### 10.11 GROUP BY

Agrupa filas que tienen mismos valores.

Buscamos las máximas edades de cada grupo:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2044.png)

Contamos las edades:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2045.png)

Contamos las edades y además ordenamos de forma ascendente:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2046.png)

Y si además ponemos una restricción para que sólo nos muestre las edades superiores a 15:

```sql
SELECT MAX(age) FROM users GROUP BY age;

SELECT COUNT(age), age, FROM users GROUP BY age;

SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age ASC;

SELECT COUNT(age), age FROM users WHERE age > 15 GROUP BY age ORDER BY age ASC;
```

### 10.12 HAVING

Sirve para crear limitaciones a los resultados de agrupaciones. 

<aside>
💡

Los HAVING se usan bastante con los GROUP BY.

</aside>

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2047.png)

```sql
SELECT COUNT(age) FROM users HAVING COUNT(age) > 3;
```

### 10.13 CASE

Un CASE nos permite ejecutar una lógica concreta en función de una condición. 

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2048.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2049.png)

Añadimos un nuevo usuario a la tabla users llamado “Kontrol” que tiene 18 años.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2050.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2051.png)

```sql
SELECT *,
CASE
	WHEN age > 17 THEN 'Es mayor de edad'
    ELSE 'Es menor de edad'
END AS agetext
FROM users;

SELECT *,
CASE
	WHEN age > 17 THEN True
    ELSE False
END AS '¿Es mayor de edad?'
FROM users;

SELECT *,
CASE
	WHEN age > 18 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Acaba de cumplir la mayoría de edad'
    ELSE 'Es menor de edad'
END AS '¿Es mayor de edad?'
FROM users;
```

### 10.14 IFNULL

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2052.png)

```sql
SELECT COUNT(age) FROM users HAVING COUNT(age) > 3;
```

### 10.15 Otros modificadores

[https://www.w3schools.com/sql/sql_ref_mysql.asp](https://www.w3schools.com/sql/sql_ref_mysql.asp)

## 11. Escritura de datos

### 11.1 INSERT

Vemos como antes de la última ejecución, si intentábamos insertar el user_id 7 nos daba error, puesto que en la clave primaria no puede haber ni nulos ni duplicados.

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2053.png)

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2054.png)

```sql
INSERT INTO users (user_id, name, surname) VALUES (8, 'María', 'López');

INSERT INTO users (name, surname) VALUES ('Paco', 'Pérez');

INSERT INTO users (user_id, name, surname) VALUES (11, 'El', 'Merma');
```

Después de los inserts el estado de la tabla es el siguiente:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2055.png)

### 11.2 UPDATE

<aside>
💡

Los UPDATE siempre se hacen con una regla de filtrado

</aside>

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2056.png)

```sql
UPDATE users SET age = '21' WHERE user_id = 11;

UPDATE users SET age = '20' WHERE user_id = 11;

UPDATE users SET age = 20, init_date = '2020-10-12' WHERE user_id = 11;
```

Tras ejecutar las sentencias UPDATE la tabla users nos queda así:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2057.png)

### 11.3 DELETE

<aside>
💡

Al igual que en el caso de update, tenemos que usar una regla de filtrado

</aside>

Borramos al usuario “El Merma”:

```sql
DELETE from users WHERE user_id = 11;
```

## 12. Administración de la base de datos

### 12.1 CREATE DATABASE

```sql
CREATE DATABASE test;
```

### 12.2 DROP DATABASE

```sql
DROP DATABASE test;
```

## 13. Administración de tablas

Para no interferir con el trabajo realizado previamente, vamos a crear de nuevo la base de datos “test” y sobre esta vamos a empezar a trabajar.

Además, vamos a crear una nueva conexión en MySQL Workbench que vaya directamente a la base de datos “test”:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2058.png)

### 13.1 CREATE TABLE

```sql
CREATE TABLE people (
	id int,
    name varchar(100),
    age int,
    email varchar(50),
    created date
);
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2059.png)

### 13.2 NOT NULL

NOT NULL es una restricción a nivel de columna que nos impide insestar datos nulos en las filas de dicha columna.

Creamos una segunda tabla llamada “people2” en la que hacemos uso de la restricción “NOT NULL” para dos de sus columnas:

```sql
CREATE TABLE people2 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created date
);
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2060.png)

### 13.3 UNIQUE

Con la restricción UNIQUE a nivel de columna, lo que conseguimos es que no puedan haber duplicados en dicha columna, es decir, no podremos insertar 2 veces el mismo valor en dicha columna.

```sql
CREATE TABLE people3 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id)
);
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2061.png)

### 13.4 PRIMARY KEY

PRIMARY KEY nos sirve para indicar cuál o cuales son los identificadores principales de la tabla. 

Esto nos va a servir para que cuando una tabla se tenga que relacionar con otras, este va a ser el campo principal que va a servir para designar cada uno de los registros. 

```sql
CREATE TABLE people4 (
	id int,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    PRIMARY KEY(id)
);
```

### 13.5 CHECK

CHECK nos sirve para añadir restricciones a la hora de crear una tabla.

```sql
CREATE TABLE people5 (
	id int,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    PRIMARY KEY(id),
    CHECK(age >= 18)
);
```

De hecho si comprobamos el script de creación de la tabla:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2062.png)

### 13.6 DEFAULT

Nos sirve para establecer valores por defecto para las columnas de la tabla, de forma que evitamos que se quede un valor nulo en dicha columna.

Como ejemplo vamos a añadir un valor default a la columna “created” de forma que usando una función de MySQL nos cargue la fecha y la hora del sistema:

```sql
CREATE TABLE people6 (
	id int,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY(id),
    CHECK(age >= 18)
);
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2063.png)

### 13.7 AUTO INCREMENT

Con AUTO_INCREMENT podemos indicar que cada vez que se inserte un nuevo dato, utilice el último identificador que exista en la base de datos, y lo va a autoincrementar.

```sql
CREATE TABLE people7 (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY(id),
    CHECK(age >= 18)
);
```

### 13.8 DROP TABLE

```sql
CREATE TABLE people8(
	name varchar(100) NOT NULL
);

DROP TABLE people8;
```

### 13.9 ALTER TABLE & ADD

Con ALTER TABLE podemos modificar la estructura de la tabla.

Podemos modificarla añadiendo, borrando, renombrando cosas o hasta cambiando el tipo de dato.

```sql
CREATE TABLE people8 (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY(id),
    CHECK(age >= 18)
);

ALTER TABLE people8 
ADD surname varchar(150);
```

Si consultamos la tabla:

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2064.png)

### 13.11 RENAME COLUMN

Este sirve para renombrar un campo.

```sql
ALTER TABLE people8
RENAME COLUMN surname TO description;
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2065.png)

### 13.12 MODIFY COLUMN

Este en cambio sirve para actualizar el tipo de un campo.

```sql
ALTER TABLE people8
MODIFY COLUMN description varchar(250);
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2066.png)

### 13.13 DROP COLUMN

```sql
ALTER TABLE people8
DROP COLUMN description;
```

![image.png](Curso%20de%20SQL%20y%20BD%20Brais%20Moure%20(2024)%20b90701868ad8485da9a1d73da24c0529/image%2067.png)
