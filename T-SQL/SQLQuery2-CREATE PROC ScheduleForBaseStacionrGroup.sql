USE PV_319_Import
SET DATEFIRST 1
GO
ALTER PROCEDURE sp_ScheduleForBaseStacionarGroup
			@group_name					 NVARCHAR(16),
			@discipline_name			 NVARCHAR(150),
			@tacher_last_name			 NVARCHAR(50),
			@start_date					 DATE,
			@time						TIME(0),
			@lerning_1					TINYINT,
			@lerning_2					TINYINT,
			@lerning_3					TINYINT,
			@alternating_day			 TINYINT,
			@first_week_present			 BIT
AS
BEGIN
		DECLARE @group	                AS				INT			=    (SELECT group_id		  FROM Groups	   WHERE group_name=@group_name)
		DECLARE @discipline	            AS			    SMALLINT	=	 (SELECT discipline_id    FROM Disciplines WHERE discipline_name LIKE @discipline_name)
		DECLARE @teacher                AS				SMALLINT	=	 (SELECT teacher_id		  FROM Teachers    WHERE last_name = @tacher_last_name)
		DECLARE @date				    AS		        DATE		=	 @start_date
		DECLARE @current_week_present	AS	            BIT         =	 @first_week_present
		DECLARE @number_of_lesson		AS		        TINYINT		=	 (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline)
		DECLARE @lesson_number			AS				TINYINT		=	 0

		WHILE(@lesson_number< @number_of_lesson)
		BEGIN 
			PRINT(@date)
			PRINT(DATENAME(WEEKDAY,@date))
			PRINT(@lesson_number+1)
			PRINT(@time)
			SET @lesson_number = @lesson_number+1
			PRINT(@lesson_number+1)
			PRINT(DATEADD(MINUTE,95,@time))
			PRINT('---------------------------------')

			IF(DATEPART(WEEKDAY,@date)=@alternating_day)
			BEGIN
				SET @date =DATEADD(WEEK,2,@date)
			END
			IF(DATEPART(WEEKDAY,@date)=4)
			BEGIN
				SET @date =IIF(@current_week_present=1,DATEADD(WEEk,1,@date),DATEADD(DAY,5,@date))
			END
			SET @current_week_present = IIF(@current_week_present=1,0,1)
			PRINT('=======================================')
		END	
END