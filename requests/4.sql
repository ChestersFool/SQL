-- Active: 1682924378687@@127.0.0.1@3306@lab7
SELECT s.`ID`, s.`Last_name`, s.`Student_name`, s.`Surname`, r.`Subject_name`, s.`Certificate_number`
FROM students s, records r
WHERE s.ID = r.ID; 