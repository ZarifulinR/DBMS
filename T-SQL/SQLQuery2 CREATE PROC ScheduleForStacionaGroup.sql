USE PV_319_Import;
GO
CREATE PROCEDURE dbo.sp_ScheduleForGroup
			@group_nsme   NVARCHAR(16),
			@disciplin_name NVARCHAR(150),
			@teacher_last_name NVARCHAR(50),
			@start_date DATE,
			@time TIME(0)
AS 
BEGIN
		SET DATEFIRST 1
		DECLARE @group				 AS INT			=		(SELECT group_id FROM Groups WHERE group_name= @group_nsme)
		DECLARE @discipline			 AS SMALLINT	=		(SELECT discipline_id FROM Disciplines  WHERE  discipline_name LIKE @disciplin_name);
		DECLARE @teacher			 AS SMALLINT	=		(SELECT teacher_id FROM Teachers WHERE last_name =@teacher_last_name);
		DECLARE @date				 AS DATE		=		@start_date;
		DECLARE @number_of_lesson	 AS TINYINT		=		(SELECT number_of_lessons FROM Disciplines WHERE discipline_id =@discipline);
		DECLARE @lesson				 AS TINYINT		=		1;


PRINT (@number_of_lesson);
WHILE (@lesson <= @number_of_lesson)
 BEGIN 
		PRINT (@date);
		PRINT (DATENAME(WEEKDAY,@date));
		PRINT(@lesson);
		Print(@time);
	IF NOT EXISTS (SELECT * FROM Schedule WHERE [group]=@group AND discipline= @discipline AND [date]= @date AND [time] = @time)
	BEGIN
		INSERT Schedule
    ([group],discipline,teacher,[date],[time],spent)
VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));

	
	END
		SET @lesson =@lesson+1;
		PRINT(@lesson);
		PRINT(DATEADD(MINUTE,95,@time));
	IF NOT EXISTS (SELECT * FROM Schedule WHERE [group]=@group AND discipline= @discipline AND [date]= @date AND [time] = DATEADD(MINUTE,95,@time))
		BEGIN
			INSERT Schedule
				 ([group],discipline,teacher,[date],[time],spent)
		VALUES (@group,@discipline,@teacher,@date,DATEADD(MINUTE,95,@time),IIF(@date < GETDATE(),1,0));

		END

		SET @lesson =@lesson+1;
		PRINT('--------------');
		if(DATEPART(WEEKDAY,  @date)=6)
		BEGIN
			SET @date = DATEADD(DAY,3 ,@date);
		END
		ELSE 
		BEGIN 
				SET @date =DATEADD(DAY,2,@date);
		END
END

END