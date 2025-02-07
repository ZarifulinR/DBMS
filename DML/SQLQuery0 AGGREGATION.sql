USE PV_319_DDL;
GO
SELECT
		group_name		AS N'Группа ',
		COUNT(student_id)			AS N'Колличество студентов'
FROM Students,Groups
WHERE [group] =group_id
GROUP BY group_name
ORDER BY N'Колличество сегдентов'
GO

	