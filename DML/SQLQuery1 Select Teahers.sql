USE PV_319_DDL;
GO  
 
			
	
			

			
			
		SELECT 
		discipline,Count(*) AS teacher_count

		FROM  Teachers,TeachersDisciplinesRelation,Disciplines
		WHERE discipline = discipline_id AND teacher = teacher_id
		GROUP BY discipline
