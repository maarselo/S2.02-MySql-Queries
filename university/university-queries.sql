/*1.Returns a list with the first name, middle name, and first name of all students. The list must be sorted alphabetically from lowest to highest by first name, middle name, and first name.*/
SELECT apellido1, apellido2, nombre FROM Persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

/*2.Find out the name and both surnames of students who have not registered their telephone number in the database*/
SELECT nombre, apellido1, apellido2 FROM Persona WHERE telefono IS NULL AND tipo = 'alumno';

/*3.Returns the list of students who were born in 1999.*/
SELECT * FROM Persona WHERE (fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31') AND tipo = 'alumno';

/*4.Returns the list of teachers who have not registered their telephone number in the database and whose NIF ends in K.*/
SELECT * FROM Persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

/*5.Returns the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.*/
SELECT * FROM Asignatura WHERE cuatrimestre=1 AND curso=3 AND id_grado = 7;

/*6.Returns a list of professors along with the name of the department they are linked to. The list should return four columns, first name, second name, first name, and department name. The result will be sorted alphabetically from lowest to highest by last name and first name.*/
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM Profesor AS pf INNER JOIN Departamento AS d ON pf.id_departamento=d.id INNER JOIN Persona AS p ON pf.id_profesor = p.id ORDER BY p.apellido1, p.apellido2, p.nombre;

/*7.Returns a list with the name of the subjects, start year and end year of the school year of the student with NIF 26902806M.*/
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM Persona AS p INNER JOIN Alumno_se_matricula_asignatura AS am ON p.id = am.id_alumno INNER JOIN Asignatura AS a ON a.id=am.id_asignatura INNER JOIN Curso_escolar AS c ON am.id_curso_escolar=c.id WHERE p.tipo='alumno' AND nif='26902806M'; 

/*8.Returns a list with the names of all the departments that have professors who teach a subject in the Degree in Computer Engineering (2015 Syllabus).*/
SELECT DISTINCT d.nombre FROM Departamento AS d INNER JOIN Profesor AS p ON d.id=p.id_departamento INNER JOIN Asignatura AS a ON p.id_profesor = a.id_profesor INNER JOIN Grado AS g ON a.id_grado = g.id WHERE g.nombre='Grado en Ingeniería Informática (Plan 2015)';

/*9.Returns a list of all students who have enrolled in a subject during the 2018/2019 school year.*/
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM Persona AS p INNER JOIN alumno_se_matricula_asignatura AS am ON p.id=am.id_alumno INNER JOIN Curso_escolar AS c ON am.id_curso_escolar = c.id WHERE p.tipo = 'alumno' AND c.anyo_inicio=2018 AND c.anyo_fin = 2019;


/*SOLVE THE FOLLOWING 6 QUERIES USING LEFT JOIN AND RIGHT JOIN CLAUSES.*/
/*1.Returns a list with the names of all professors and the departments they are associated with. The list should also show those professors who do not have any associated departments. The list should return four columns, department name, first last name, second last name and professor's name. The result will be sorted alphabetically from lowest to highest by department name, last names and first name.*/
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM Persona AS p LEFT JOIN Profesor AS pf ON p.id=pf.id_profesor LEFT JOIN Departamento AS d ON d.id=pf.id_departamento WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

/*2.Returns a list of teachers who are not associated with a department.*/
SELECT p.nombre FROM Persona AS p LEFT JOIN Profesor AS pf ON p.id=pf.id_profesor WHERE p.tipo = 'profesor' AND pf.id_departamento IS NULL;

/*3.Returns a list of departments that do not have associated professors.*/
SELECT d.nombre FROM Departamento AS d LEFT JOIN Profesor As p ON p.id_departamento=d.id WHERE p.id_profesor IS NULL;

/*4.Returns a list of teachers who do not teach any subjects.*/
SELECT p.nombre FROM Persona AS p LEFT JOIN Profesor AS pf ON p.id=pf.id_profesor LEFT JOIN Asignatura AS a ON pf.id_profesor=a.id_profesor WHERE p.tipo='profesor' AND a.id IS NULL;

/*5.Returns a list of subjects that do not have an assigned teacher.*/
SELECT a.nombre FROM Asignatura As a LEFT JOIN Profesor As pf ON pf.id_profesor = a.id_profesor LEFT JOIN Persona As p ON pf.id_profesor=p.id WHERE p.nombre IS NULL;

/*6.Returns a list of all departments that have not taught subjects in any school year.*/
SELECT DISTINCT d.nombre FROM departamento AS d LEFT JOIN Profesor AS pf ON pf.id_departamento=d.id LEFT JOIN asignatura a ON a.id_profesor = pf.id_profesor WHERE a.id_profesor IS NULL;


/*SUMMARY QUERIES:*/
/*1.Returns the total number of students there are.*/
SELECT COUNT(*) AS totalAlumnos From Persona WHERE tipo='alumno';

/*2.Calculate how many students were born in 1999.*/
SELECT COUNT(*) AS totalAlumnos From PErsona WHERE tipo='alumno' AND YEAR(fecha_nacimiento) = 1999;

/*3.Calculate how many professors there are in each department. The result should only show two columns, one with the name of the department and another with the number of professors in that department. The result should only include departments that have associate professors and should be sorted from highest to lowest by the number of professors.*/
SELECT d.nombre, COUNT(p.id_profesor) AS num_profesores FROM Departamento d INNER JOIN Profesor p ON p.id_departamento=d.id GROUP BY (d.nombre) ORDER BY num_profesores DESC;

/*4.Returns a list of all departments and the number of professors in each of them. Note that there may be departments that do not have associated professors. These departments must also appear in the list.*/
SELECT d.nombre, COUNT(p.id_profesor) FROM Departamento d LEFT JOIN Profesor p ON p.id_departamento=d.id GROUP BY (d.nombre);

/*5.Returns a list with the names of all the degrees in the database and the number of subjects each has. Note that there may be degrees that do not have associated subjects. These degrees must also appear in the list. The result must be ordered from highest to lowest by the number of subjects.*/
SELECT g.nombre, COUNT(a.id) AS num_asignaturas FROM Grado g LEFT JOIN Asignatura a ON g.id=a.id_grado GROUP BY g.nombre ORDER BY num_asignaturas DESC;

/*6.Returns a list with the name of all the degrees existing in the database and the number of subjects each one has, of the degrees that have more than 40 associated subjects.*/
SELECT g.nombre, COUNT(a.id) AS num_asignaturas FROM Grado g LEFT JOIN Asignatura a ON g.id=a.id_grado GROUP BY g.nombre HAVING num_asignaturas > 40;

/*7.Returns a list showing the name of the degrees and the sum of the total number of credits for each type of subject. The result should have three columns: name of the degree, type of subject, and the sum of the credits for all subjects of that type.*/
SELECT g.nombre, a.tipo, SUM(a.creditos) FROM Grado g LEFT JOIN Asignatura a ON a.id_grado=g.id GROUP BY g.nombre, a.tipo;

/*8.Returns a list showing how many students have enrolled in a subject in each of the school years. The result should show two columns, one column with the year the school year started and another with the number of students enrolled.*/
SELECT c.anyo_inicio, COUNT(DISTINCT(am.id_alumno)) FROM Curso_escolar c LEFT JOIN alumno_se_matricula_asignatura am ON am.id_curso_escolar=c.id GROUP BY c.anyo_inicio;

/*9.Returns a list with the number of subjects taught by each teacher. The list must take into account those teachers who do not teach any subjects. The result will show five columns: id, name, first name, second name and number of subjects. The result will be sorted from highest to lowest by the number of subjects.*/
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) num_asignaturas FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY num_asignaturas DESC;

/*10.Retorna totes les dades de l'alumne/a més jove.*/
SELECT * FROM Persona ORDER BY fecha_nacimiento DESC LIMIT 1;

/*11.Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.*/
SELECT p.nombre, p.apellido1, p.apellido2 FROM Persona p INNER JOIN Profesor pf ON pf.id_profesor=p.id INNER JOIN Departamento d ON d.id=pf.id_departamento LEFT JOIN Asignatura a ON a.id_profesor=pf.id_profesor WHERE a.id_profesor IS NULL;


SELECT * FROM alumno_se_matricula_asignatura;
SELECT * FROM asignatura;
SELECT * FROM curso_escolar;
SELECT * FROM departamento;
SELECT * FROM grado;
SELECT * FROM persona;
SELECT * FROM profesor;