USE PV_319_Import;
GO
SELECT
			[Направление обучения ] = direction_name,
			[Количество дисциплин] = COUNT(discipline_name)
 FROM Disciplines,Directions,DisciplinesDirectionsRelation
 WHERE discipline = discipline_id 
 AND direction = direction_id
 GROUP BY direction_name