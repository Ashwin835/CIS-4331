--Question 1
SELECT id, name BIOLOGY_INSTRUCTORS FROM instructor
WHERE dept_name IN('Biology');


--Question 2
SELECT title AS "3Credit C S Courses"
FROM course
WHERE dept_name LIKE('C%')
AND credits=3;

--Question 3
SELECT course.course_id,title
FROM course INNER JOIN takes
ON (course.course_id=takes.course_id)
WHERE takes.id IN (12345);

--Question 4
SELECT SUM(credits)
FROM course INNER JOIN takes
ON (course.course_id=takes.course_id)
WHERE takes.id IN (12345);

--Question 5
SELECT * FROM student;



--Question 6
SELECT DISTINCT student.name FROM student
INNER JOIN takes ON
(student.id=takes.id)
WHERE takes.course_id LIKE ('C%');

--Question 7
SELECT i.id, name, t.course_id FROM instructor i
LEFT OUTER JOIN teaches t
ON(i.id=t.id)
WHERE  i.dept_name LIKE('P%');



--Question 8 part A
SELECT i.id, i.name
FROM instructor i LEFT OUTER JOIN
teaches t ON (i.id=t.id)
WHERE t.course_id IS NULL;

--Question 8 part B
SELECT i.id, i.name
FROM instructor i LEFT OUTER JOIN
teaches t ON (i.id=t.id)
MINUS
SELECT a.id, a.name
FROM instructor a INNER JOIN 
teaches b ON (a.id=b.id);

--Question 9
SELECT i.name, COUNT(*) CLASSES
FROM instructor i INNER JOIN
teaches t ON (i.id=t.id)
GROUP BY i.name
ORDER BY i.name;

--Question 10
SELECT i.name, COUNT(*) CLASSES
FROM instructor i INNER JOIN
teaches t ON (i.id=t.id)
GROUP BY i.name
HAVING COUNT(*)>=2
ORDER BY i.name;

SELECT name, COUNT(*) how_many_courses
FROM instructor i JOIN teaches t
       ON (i.id = t.id)
GROUP BY name
HAVING COUNT(*) >= 2
ORDER BY name;

--Question 11
SELECT DISTINCT a.account_number,
a.account_description FROM general_ledger_accounts a
INNER JOIN invoice_line_items b
ON(a.account_number=b.account_number)
WHERE a.account_description LIKE('%Advertising')
ORDER BY a.account_number ASC;