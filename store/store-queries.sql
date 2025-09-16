/*1.List the name of all the products in the product table.*/
SELECT nombre FROM Producto;

/*2.Lists the names and prices of all the products in the product table.*/
SELECT nombre, precio FROM Producto;

/*3.List all the columns in the product table.*/
SELECT * FROM Producto;

/*4.List the name of the products, the price in euros, and the price in US dollars (USD).*/
SELECT nombre, precio, ROUND(precio * 0.84, 2) FROM Producto;

/*5.List the product name, the price in euros, and the price in US dollars (USD). Use the following column aliases: product name, euros, dollars.*/
SELECT nombre AS ProductName, precio AS Euros, ROUND(precio * 0.84, 2) AS Dollars FROM Producto;

/*6.Lists the names and prices of all the products in the product table, converting the names to uppercase.*/
SELECT UPPER(nombre), precio FROM Producto;

/*7.Lists the names and prices of all the products in the product table, converting the names to lowercase.*/
SELECT LOWER(nombre), precio FROM Producto;

/*8.List the name of all the manufacturers in one column, and in another column capitalize the first two characters of the manufacturer's name.*/
SELECT nombre,  UPPER(LEFT(nombre, 2)) FROM Fabricante;

/*9.Lists the names and prices of all the products in the product table, rounding the price value.*/
SELECT nombre, ROUND(precio, 0) FROM Producto;

/*10.Lists the names and prices of all products in the product table, truncating the price value to display it without any decimal places.*/
SELECT nombre, TRUNCATE(precio, 0) FROM Producto;

/*11.List the code of the manufacturers that have products in the product table.*/
SELECT codigo_fabricante FROM Producto;

/*12.List the code of the manufacturers that have products in the product table, eliminating codes that appear repeatedly.*/
SELECT DISTINCT codigo_fabricante FROM Producto;

/*13.List the names of the manufacturers in ascending order.*/
SELECT nombre FROM fabricante ORDER BY nombre;

/*14.List the names of the manufacturers in descending order.*/
SELECT nombre FROM fabricante ORDER BY nombre DESC;

/*15.Lists the names of the products sorted, first, by name in ascending order and, second, by price in descending order.*/
SELECT nombre FROM producto ORDER BY nombre, precio DESC;

/*16.Returns a list with the first 5 rows of the manufacturer table.*/
SELECT * FROM fabricante LIMIT 5;

/*17.Returns a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row must also be included in the response.*/
SELECT * FROM fabricante LIMIT 5 OFFSET 3;

/*18.List the name and price of the cheapest product. (Use only ORDER BY and LIMIT clauses.) NOTE: You couldn't use MIN(price) here, you would need GROUP BY.*/
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;

/*19.List the name and price of the most expensive product. (Use only ORDER BY and LIMIT clauses.) NOTE : You couldn't use MAX(price) here, you would need GROUP BY.*/
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1 ;

/*20.Lists the name of all products from the manufacturer whose manufacturer code is equal to 2.*/
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

/*21.Returns a list with the product name, price and manufacturer name of all products in the database.*/
SELECT p.nombre, p.precio, f.nombre FROM Producto AS p LEFT JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo;

/*22.Returns a list with the product name, price, and manufacturer name of all products in the database. Sorts the result by manufacturer name, in alphabetical order.*/
SELECT p.nombre, p.precio, f.nombre FROM Producto AS p LEFT JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo ORDER BY p.nombre;

/*23.Returns a list with the product code, product name, manufacturer code and manufacturer name of all the products in the database.*/
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM Producto AS p LEFT JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo;

/*24.Returns the product name, its price and the name of its manufacturer, of the cheapest product.*/
SELECT p.nombre, p.precio, f.nombre FROM Producto AS p LEFT JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;

/*25.Returns the product name, its price and the name of its manufacturer, of the most expensive product.*/
SELECT p.nombre, p.precio, f.nombre FROM Producto AS p LEFT JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

/*26.Returns a list of all products from the manufacturer Lenovo.*/
SELECT p.nombre FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante = 2;

/*27.Returns a list of all products from the manufacturer Crucial that have a price greater than €200.*/
SELECT p.nombre FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante = 6 AND p.precio > 200;


/*28.Returns a list with all products from manufacturers Asus, Hewlett-Packard, and Seagate. Without using the IN operator.*/
SELECT p.nombre FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE (p.codigo_fabricante = 1 OR p.codigo_fabricante = 3 OR p.codigo_fabricante = 5);

/*29.Returns a list with all products from manufacturers Asus, Hewlett-Packard, and Seagate. Using the IN operator.*/
SELECT p.nombre FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN('Asus', 'Hewlett-Packard', 'Seagate');

/*30.Returns a list with the name and price of all products from manufacturers whose names end with the vowel e.*/
SELECT p.nombre, p.precio FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';

/*31.Returns a list with the name and price of all products whose manufacturer name contains the character w in their name.*/
SELECT p.nombre, p.precio FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';

/*32.Returns a list with the product name, price and manufacturer name of all products that have a price greater than or equal to €180. Sorts the result, first, by price (in descending order) and, second, by name (in ascending order).*/
SELECT p.nombre, p.precio, f.nombre FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;

/*33.Returns a list with the manufacturer code and name, only of those manufacturers that have associated products in the database.*/
SELECT DISTINCT f.codigo, f.nombre FROM Fabricante AS f INNER JOIN Producto AS p ON f.codigo = p.codigo_fabricante; 

/*34.Returns a list of all manufacturers that exist in the database, along with the products that each of them has. The list should also show those manufacturers that do not have associated products.*/
SELECT f.nombre, p.nombre FROM Fabricante AS f LEFT JOIN Producto AS p ON f.codigo = p.codigo_fabricante; 

/*35.Returns a list where only those manufacturers that do not have any associated products appear.*/
SELECT f.nombre FROM Fabricante AS f LEFT JOIN Producto AS p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL; 

/*36.Returns all products from the manufacturer Lenovo. (Without using INNER JOIN).*/
SELECT nombre FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'Lenovo');

/*37.Returns all data for products that have the same price as the most expensive product from the manufacturer Lenovo. (Without using INNER JOIN).*/
SELECT p.* FROM Producto AS p WHERE p.precio = (SELECT MAX(pp.precio) FROM Producto AS pp WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'Lenovo'));

/*38.List the name of the most expensive product from the manufacturer Lenovo.*/
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;

/*39.List the name of the cheapest product from the manufacturer Hewlett-Packard.*/
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;

/*40.Returns all products in the database that have a price greater than or equal to the most expensive product from the manufacturer Lenovo.*/
SELECT p.nombre, p.precio FROM Producto AS p WHERE p.precio >= (SELECT MAX(pp.precio) FROM Producto AS pp INNER JOIN Fabricante AS f ON pp.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo'  GROUP BY f.nombre); /*No necesario el gorup by*/

/*41.List all products from the manufacturer Asus that are priced higher than the average price of all their products.*/
SELECT p.nombre AS Nombre, p.precio FROM Producto AS p INNER JOIN Fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(pp.precio) FROM Producto AS pp WHERE pp.codigo_fabricante = p.codigo_fabricante);
