USE PV_319_Import;
GO
DECLARE @group				 AS INT			=		(SELECT group_id FROM Groups WHERE group_name= N'PV_319')
DECLARE @discipline			 AS SMALLINT	=		(SELECT discipline_id FROM Disciplines  WHERE  discipline_name LIKE N'Объектно-ориент%');
DECLARE @teacher			 AS SMALLINT	=		(SELECT teacher_id FROM Teachers WHERE first_name = N'Олег');
DECLARE @start_date			 AS DATE		=		N'2024-06-01';
DECLARE @date				 AS DATE		=		@start_date;
DECLARE @number_of_lesson	 AS TINYINT		=		(SELECT number_of_lessons FROM Disciplines WHERE discipline_id =@discipline);
DECLARE @lesson				 AS TINYINT		=		1;
DECLARE @time                AS TIME(0)		=		N'18:30';


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
SELECT * FROM Schedule
