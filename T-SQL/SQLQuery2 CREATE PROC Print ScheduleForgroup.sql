USE PV_319_Import;
GO
ALTER PROCEDURE sp_PrintScheduleForGroup
		@group_name NVARCHAR(16),
		@discipline_name NVARCHAR(150) = N''
AS
BEGIN 
		--DECLARE @group AS INT =(SELECT group_id FROM Groups WHERE group_name = @group_name)
		--DECLARE @disciplin_name AS SMALLINT =
		--IIF(@discipline_name =NULL, 0,(SELECT discipline_id FROM Disciplines WHERE discipline_name =@discipline_name));
		SELECT 
		[������] = group_name,
		[����������]= discipline_name,
		[�������������]= FORMATMESSAGE(N'%s %s %s', last_name,first_name,middle_name),
		[����]		= DATENAME(WEEKDAY,[date]),
		[����]	=	[date],
		[�����] =   [time],
		[������] = IIF(spent = 1 , N'���������', N'�������������')
		FROM Teachers,Disciplines,Groups, Schedule
		WHERE [group]		=		group_id
		AND discipline      =		discipline_id
		AND group_name		=	   @group_name
		AND teacher			=	   teacher_id
		AND discipline_name LIKE	   IIF(@discipline_name = N'', N'%', @discipline_name)
END