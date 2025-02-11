USE PV_319_Import;
GO
SELECT 
		discipline_name AS N'Дисциплина',
		number_of_lessons AS N'Количество занятий'
FROM Directions,Disciplines,DisciplinesDirectionsRelation
WHERE
discipline = discipline_id
AND direction = direction_id
AND direction_name LIKE N'%дизайн' 
GO
--SELECT  [Направление обучения] =direction_name,
--		[Количество дисциплин]= COUNT(discipline)

--FROM Disciplines,Directions,DisciplinesDirectionsRelation
--WHERE discipline = discipline_id 
--AND   direction=direction_id
--GROUP BY direction_name
SELECT 
			[Направление обучения]= direction_name,
			[Количество занятий] = SUM(number_of_lessons)
FROM Disciplines,Directions,DisciplinesDirectionsRelation
WHERE direction = direction_id
AND discipline= discipline_id
GROUP BY direction_name
