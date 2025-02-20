USE PV_319_Import;
GO
ALTER PROCEDURE sp_PrintScheduleForGroupPeriod
@group_name				NVARCHAR(16),
@start_date				DATE,
@end_date				DATE
AS 
BEGIN
	SELECT 
		[Группа]				=     group_name,
		[Дисциплина]			=     discipline_name,
		[Преподаватель]		    =     FORMATMESSAGE(N'%s %s %s', last_name,first_name, middle_name),
		[День]					=     DATENAME(WEEKDAY,[date]),
		[Дата]					=	  [date],
		[Время]					=	  [time],
		[Статус]				=	 IIF(spent =1,N'Проведено ', N'Запланированно')
	FROM Schedule,Groups,Disciplines,Teachers
	WHERE	[group]			=	 group_id 
	AND		discipline		=	discipline_id
	AND		teacher			=	teacher_id
	AND		[date]	BETWEEN @start_date AND @end_date 
END
