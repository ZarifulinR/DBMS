USE PV_319_Import;
SET DATEFIRST 1
GO


ALTER PROCEDURE sp_AddHolidays
@year AS SMALLINT,
@name AS NVARCHAR(150)
AS
BEGIN 
	DECLARE @start_date AS DATE = dbo.GetHolidayStartDate(@name,@year),
	 @duration AS TINYINT = dbo.GetHolidaysDuration(@name),
	 @holiday_id AS TINYINT = dbo.GetHolidayID(@name)
	 DECLARE
	 @date AS DATE = @start_date,
	 @day AS TINYINT =0
	 WHILE @day<@duration
	 BEGIN 
	  INSERT DaysOFF
	  ([date],holiday)
	  VALUES (@date,@holiday_id)
	  SET @day+=1
	  SET @date = DATEADD(DAY,1,@date)
	  END
	 
END
 