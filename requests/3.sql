-- Active: 1682924378687@@127.0.0.1@3306@lab7
SELECT `Last_name`, `Student_name`, `Surname`, `School`
FROM students
WHERE `School` = 6 AND Last_name LIKE "К%"