USE PV_319_Import;
GO
SELECT
			[Направление обучения] = direction_name,
			[Количество преподавателей] = 
			(SELECT SUM(teachers.number_of_teachers)
			FROM		(SELECT discipline_id,COUNT(teacher_id) AS number_of_teachers
						FROM Teachers,Disciplines,TeachersDisciplinesRelation
						WHERE teacher = teacher_id AND discipline = discipline_id
						GROUP BY discipline_id
						)teachers,TeachersDisciplinesRelation ,Disciplines
						WHERE Disciplines.discipline_id = TeachersDisciplinesRelation.discipline
						AND DisciplinesDirectionsRelation.discipline = 
						)
			  

			
			
FROM		Directions,Disciplines,DisciplinesDirectionsRelation
WHERE		direction=direction_id 
AND			discipline = discipline_id