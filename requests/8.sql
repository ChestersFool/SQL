-- Active: 1682924378687@@127.0.0.1@3306@lab7
SELECT s.`Last_name`, s.`Student_name`, s.`Surname`, r.`Subject_name`, MAX(res.`Result`)
FROM students s, records r, results res
WHERE s.ID = r.ID AND res.`ID_Record` = r.`ID`
GROUP BY s.`Last_name`, s.`Student_name`, s.`Surname`, r.`Subject_name`;