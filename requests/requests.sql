-- Active: 1682793559755@@127.0.0.1@3306@lab7
-- !1
SELECT Last_name, Student_name, Surname FROM students;

-- !2
SELECT `Result` `ID_Record`
FROM results
WHERE `Result` > 150;

-- !3
SELECT `Last_name`, `Student_name`, `Surname`, `School`
FROM students
WHERE `School` = 6 AND Last_name LIKE "К%";

-- !4
SELECT s.`ID`, s.`Last_name`, s.`Student_name`, s.`Surname`, r.`Subject_name`, s.`Certificate_number`
FROM students s, records r
WHERE s.ID = r.ID; 

-- !5
SELECT s.`ID`, s.`Last_name`, s.`Student_name`, s.`Surname`, r.`Subject_name`, s.`Certificate_number`
FROM students s, records r
WHERE s.ID = r.ID AND r.`Subject_name` = "Математика";

-- !6
SELECT `Subject_name`, `Event_date`
FROM subjects
ORDER BY `Event_date`;

-- !7 age calculation
SELECT `Last_name` `Student_name` `Surname`, 
FROM students;
-- !8 !9 агрегатних функцій
SELECT s.`Last_name`, s.`Student_name`, s.`Surname`, MAX(res.`Result`) `Max_result`
FROM students s, records r, results res
WHERE s.`ID` = r.`Student` AND res.`ID_Record` = r.`ID`
GROUP BY s.`Last_name`, s.`Student_name`, s.`Surname`;
-- !9 групування

-- !10 групування та умови, що накладаються на групи. (having)
SELECT s.`Last_name`, s.`Student_name`, s.`Surname`, COUNT(res.`Result`) `Count_results`
from students s, records r, results res
where r.`Student` = s.`ID` AND res.`ID_Record` = r.`ID`
GROUP BY s.`Last_name`, s.`Student_name`, s.`Surname`
HAVING COUNT(res.`Result`) = 2;
-- !11 групування та сортуванням. (GROUP BY, ORDER BY)
SELECT s.`Last_name`, s.`Student_name`, s.`Surname`, AVG(res.`Result`) `Avg_result`
from students s, records r, results res
where r.`Student` = s.`ID` AND res.`ID_Record` = r.`ID`
GROUP BY s.`Last_name`, s.`Student_name`, s.`Surname`
ORDER BY `Avg_result`;
-- !12 групування та умови, що накладаються на групи та сортуванням (GROUP BY, ORDER BY, HAVING)

-- !13 простого підзапиту
SELECT DISTINCT s.`Last_name`, s.`Student_name`, s.`Surname`, AVG(res.`Result`) `Avg_result`
from students s, records r, results res
where r.`Student` = s.`ID` AND res.`ID_Record` = r.`ID` and s.`ID` NOT IN (
    SELECT r.`Student`
    FROM records r, results res
    WHERE r.`ID` = res.`ID_Record` AND res.`Result` < 150
)
GROUP BY s.`Last_name`, s.`Student_name`, s.`Surname`;

-- !14 корельованого підзапиту
SELECT e.`Last_name`, e.`Examiner_name`, e.`Surname`, e.`ID`, e.`Subject_name`
FROM examiners e
WHERE e.`Is_senior` = 1 AND e.`ID` IN (
    SELECT r.`senior_examiner`
    FROM records r
    WHERE r.`Subject_name` = e.`Subject_name`
);