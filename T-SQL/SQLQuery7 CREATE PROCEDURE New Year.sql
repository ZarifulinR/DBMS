USE PV_319_Import
SET DATEFIRST 1;
GO
CREATE PROCEDURE sp_AddNewYearHolidaysFor
	@year	AS		SMALLINT
	AS
BEGIN
		DECLARE @new_year_date AS DATE = DATEFROMPARTS(2025,01,01);
		DECLARE @weekday AS TINYINT  = DATEPART(WEEKDAY,@new_year_date);
		DECLARE @start_date AS DATE = DATEADD(DAY,1-@weekday,@new_year_date);
		DECLARE @date AS DATE = @start_date 
		DECLARE @duration AS TINYINT = (SELECT duration FROM Holidays WHERE holiday_id=1)
		--DECLARE @day AS TINYINT = 0;

		WHILE  @duration>0
		BEGIN
			INSERT DaysOFF ([date],holiday) VALUES (@date,1)
			
			SET @date = DATEADD(DAY,1,@date)
			SET @duration = @duration-1;
 		END

		PRINT (@new_year_date);
		PRINT(@weekday);
		PRINT(@start_date);

END