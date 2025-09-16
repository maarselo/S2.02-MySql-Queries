 # 🗄️ 2.2-MySql-Queries
This project contains SQL exercises based on two databases: Tienda and Universidad.
Both databases are provided in .zip files, including their structure and insert scripts.

The goal is to practice querying relational databases using MySQL Workbench.

## 📄 Description - Exercise Statement
This project is a collection of SQL query exercises designed to practice real-world relational database operations using MySQL Workbench.

The work is divided into two independent databases:

🛍️ Tienda: A simplified store database with two related tables (producto and fabricante). The exercises focus on learning how to:

- Retrieve and filter data with SELECT and WHERE
- Format results using functions (UPPER, LOWER, ROUND, TRUNCATE)
- Apply ordering and limits (ORDER BY, LIMIT)
- Work with relationships (JOIN and subqueries)
- Identify manufacturers with and without products

🎓 Universidad: A more complex academic database with entities such as students, professors, subjects, departments, and enrollments. The exercises cover:

- Multi-table queries with INNER JOIN, LEFT JOIN, and RIGHT JOIN
- Filtering conditions with string operators (LIKE, IN)
- Working with dates and constraints (e.g., students born in a given year)
- Aggregations and grouping (COUNT, AVG, SUM, GROUP BY, HAVING)
- Advanced queries combining several clauses to extract meaningful reports

### 🛍️ Database: Tienda
We work with two tables:

- producto (codigo, nombre, precio, codigo_fabricante)
- fabricante (codigo, nombre)

Where producto.codigo_fabricante is related to fabricante.codigo.

*Queries to solve include*: 
1. List the name of all products in the producto table.
2. List the names and prices of all products.
3. List all columns of the producto table.
4. Show product name, price in euros, and price in US dollars.
5. Same as above, but with column aliases: product name, euros, dollars.
6. List names and prices of all products with names in uppercase.
7. List names and prices of all products with names in lowercase.
8. Show all manufacturers, plus the first two characters of their name in uppercase.
9. Show product names and prices rounded to the nearest integer.
10. Show product names and truncated prices (no decimals).
11. Show manufacturer codes that have products.
12. Same as above but without duplicates.
13. List manufacturer names in ascending order.
14. List manufacturer names in descending order.
15. List products ordered first by name (ASC), then by price (DESC).
16. Return the first 5 rows from fabricante.
17. Return 2 rows starting from the 4th row (inclusive).
18. Show name and price of the cheapest product (using ORDER BY + LIMIT).
19. Show name and price of the most expensive product (using ORDER BY + LIMIT).
20. Show all products from manufacturer with code = 2.
21. Show product name, price, and manufacturer name for all products.
22. Same as above but ordered alphabetically by manufacturer name.
23. Show product code, product name, manufacturer code, and manufacturer name.
24. Show cheapest product with its manufacturer.
25. Show most expensive product with its manufacturer.
26. Show all products from manufacturer Lenovo.
27. Show all products from Crucial with price > 200 €.
28. Show all products from manufacturers Asus, Hewlett-Packard, Seagate (without IN).
29. Same as above using IN.
30. Show products whose manufacturer ends with the vowel "e".
31. Show products whose manufacturer name contains "w".
32. Show products with price ≥ 180 €, ordered by price (DESC) and then name (ASC).
33. Show manufacturer codes and names for those who have products.
34. Show all manufacturers with their products, including those with none (LEFT JOIN).
35. Show only manufacturers with no products.
36. Show all products from Lenovo (without INNER JOIN).
37. Show products with the same price as Lenovo’s most expensive product (no INNER JOIN).
38. Show the most expensive Lenovo product.
39. Show the cheapest Hewlett-Packard product.
40. Show all products with price ≥ Lenovo’s most expensive product.
41. Show all Asus products priced above Asus’s average product price.

### 🎓 Database: Universidad
We work with several tables:
- alumno (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo)
- profesor (id, nif, nombre, apellido1, apellido2, direccion, telefono)
- departamento (id, nombre)
- grado (id, nombre)
- asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado)
- curso_escolar (id, anyo_inicio, anyo_fin)
- alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar)

Where:
- asignatura.id_profesor relates to profesor.id
- profesor.id_departamento relates to departamento.id
- asignatura.id_grado relates to grado.id
- alumno_se_matricula_asignatura relates alumnos, asignaturas and cursos_escolares

*Queries to solve include*: 
1. Returns a list with the first name, middle name, and first name of all students. The list must be sorted alphabetically from lowest to highest by first name, middle name, and first name.
2. Find out the name and both surnames of students who have not registered their telephone number in the database.
3. Returns the list of students who were born in 1999.
4. Returns the list of teachers who have not registered their telephone number in the database and whose NIF ends in K.
5. Returns the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.
6. Returns a list of professors along with the name of the department they are linked to. The list should return four columns, first name, second name, first name, and department name. The result will be sorted alphabetically from lowest to highest by last name and first name.
7. Returns a list with the name of the subjects, start year and end year of the school year of the student with NIF 26902806M.
8. Returns a list with the names of all the departments that have professors who teach a subject in the Degree in Computer Engineering (2015 Syllabus).
9. Returns a list of all students who have enrolled in a subject during the 2018/2019 school year.

*Solve the following 6 queries using LEFT JOIN and RIGHT JOIN clauses:*
1. Returns a list with the names of all professors and the departments they are associated with. The list should also show those professors who do not have any associated departments. The list should return four columns, department name, first last name, second last name and professor's name. The result will be sorted alphabetically from lowest to highest by department name, last names and first name.
2. Returns a list of teachers who are not associated with a department.
3. Returns a list of departments that do not have associated professors.
4. Returns a list of teachers who do not teach any subjects.
5. Returns a list of subjects that do not have an assigned teacher.
6. Returns a list of all departments that have not taught subjects in any school year.

*Summary queries:*
1. Returns the total number of students there are.
2. Calculate how many students were born in 1999.
3. Calculate how many professors there are in each department. The result should only show two columns, one with the name of the department and another with the number of professors in that department. The result should only include departments that have associate professors and should be sorted from highest to lowest by the number of professors.
4. Returns a list of all departments and the number of professors in each of them. Note that there may be departments that do not have associated professors. These departments must also appear in the list.
5. Returns a list with the names of all the degrees in the database and the number of subjects each has. Note that there may be degrees that do not have associated subjects. These degrees must also appear in the list. The result must be ordered from highest to lowest by the number of subjects.
6. Returns a list with the name of all the degrees existing in the database and the number of subjects each one has, of the degrees that have more than 40 associated subjects.
7. Returns a list showing the name of the degrees and the sum of the total number of credits for each type of subject. The result should have three columns: name of the degree, type of subject, and the sum of the credits for all subjects of that type.
8. Returns a list showing how many students have enrolled in a subject in each of the school years. The result should show two columns, one column with the year the school year started and another with the number of students enrolled.
9. Returns a list with the number of subjects taught by each teacher. The list must take into account those teachers who do not teach any subjects. The result will show five columns: id, name, first name, second name and number of subjects. The result will be sorted from highest to lowest by the number of subjects.
10. Returns all the data of the youngest student.
11. Returns a list of professors who have an associated department and who do not teach any subjects.
## 💻 Technologies Used
- MySQL Workbench (for modeling and execution)

## 📋 Requirements
Before running this project, make sure you have:

- MySQL Server installed
- MySQL Workbench installed
- Extract the provided .zip folders
- Import the schema_* scripts into your Workbench

## 🛠️ Installation

Open MySQL Workbench and follow these steps:
1. Extract the .zip files.
2. Run the schema_*.sql script to create tables and insert info.
3. Execute the queries one by one in Workbench.
5. Verify results with MySQL Workbench

## ▶️ Running the Project

- All deliverables are standalone.

- Simply execute the .sql files in the correct order.

## 🌐 Deployment

No deployments required.
The project runs locally on MySQL Workbench.

## 🤝 Contributions

🤝 Contributions

Suggestions to improve models are welcome.

Additional queries or data sets can be proposed.


### Thanks for your interest and support! 🚀
