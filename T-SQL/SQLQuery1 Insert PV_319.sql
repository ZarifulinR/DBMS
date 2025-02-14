USE PV_319_Import;
GO
SET DATEFIRST 1
--INSERT Groups
--		(group_id,group_name,direction)
--		VALUES (319, N'PV_319',1);
--SELECT * FROM Groups
--DELETE  FROM  Schedule 

SELECT	[Группа]			=	group_name,
		[Дисциплина]		=	discipline_name,
		[Преподаватель]		=	FORMATMESSAGE(N'%s %s %s', last_name,first_name,middle_name),
		[Дата]				=	DATENAME(WEEKDAY,[date]),
		[Время]				=	[time],
		[Статус]			= IIF(spent=1 , N'проведено', N'Запланированно')
FROM Schedule ,Groups,Disciplines,Teachers
WHERE [group] = group_id AND discipline =discipline_id AND teacher = teacher_id

