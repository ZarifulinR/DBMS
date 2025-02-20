USE PV_319_Import;
GO

ALTER PROCEDURE dbo.sp_ScheduleForGroup21_12
			@group_name NVARCHAR(16)  ,
			@disciplin_name NVARCHAR(150),
			@disciplin_name2 NVARCHAR(150),
			@teacher_last_name NVARCHAR(50),
			@start_date DATE,
			@time TIME(0)
			
AS 
BEGIN
		SET DATEFIRST 1
		DECLARE @group				 AS INT			=		(SELECT group_id FROM Groups WHERE group_name= @group_name)
		DECLARE @discipline			 AS SMALLINT	=		(SELECT discipline_id FROM Disciplines  WHERE  discipline_name LIKE @disciplin_name);
		DECLARE @discipline2		 AS SMALLINT	=		(SELECT discipline_id FROM Disciplines  WHERE  discipline_name LIKE @disciplin_name);
		DECLARE @discipline3		 AS SMALLINT	=		(SELECT discipline_id FROM Disciplines  WHERE  discipline_name LIKE @disciplin_name);
		DECLARE @teacher			 AS SMALLINT	=		(SELECT teacher_id FROM Teachers WHERE last_name =@teacher_last_name);
		DECLARE @date				 AS DATE		=		@start_date;
		DECLARE @number_of_lesson	 AS TINYINT		=		(SELECT number_of_lessons FROM Disciplines WHERE discipline_id =@discipline);
		DECLARE @lesson				 AS TINYINT		=		1;
		DECLARE @week_number INT

PRINT (@number_of_lesson);
WHILE (@lesson <= @number_of_lesson)
 BEGIN 
		PRINT (@date);
		PRINT (DATENAME(WEEKDAY,@date));
		PRINT(@lesson);
		Print(@time);
		SET @week_number = DATEPART(WEEK, @date) % 2

		IF @week_number = 1  
        BEGIN
             SET @discipline = @discipline;
             SET @discipline = @discipline;
			 SET @discipline = @discipline2
        END
        ELSE  -- Чётная неделя (2 Математика, 1 Физика)
        BEGIN
            SET @discipline = @discipline2;
            SET @discipline = @discipline2;
			SET @discipline = @discipline;
        END

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
			@group_name NVARCHAR(16)  ,
			@disciplin_name NVARCHAR(150),
			@teacher_last_name NVARCHAR(50),
			@start_date DATE,
			@time TIME(0)
AS
BEGIN
		SET DATEFIRST 1
		DECLARE @group				 AS INT			=		(SELECT group_id FROM Groups WHERE group_name= @group_name)
		DECLARE @discipline			 AS SMALLINT	=		(SELECT discipline_id FROM Disciplines  WHERE  discipline_name LIKE @disciplin_name);
		DECLARE @teacher			 AS SMALLINT	=		(SELECT teacher_id FROM Teachers WHERE last_name =@teacher_last_name);
		DECLARE @date				 AS DATE		=		@start_date;
		DECLARE @number_of_lesson	 AS TINYINT		=		(SELECT number_of_lessons FROM Disciplines WHERE discipline_id =@discipline);
		DECLARE @lesson				AS TINYINT		=		1;
END
PRINT (@g