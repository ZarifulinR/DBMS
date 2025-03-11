USE PV_319_Import;
SET DATEFIRST 1;
GO
ALTER FUNCTION GetNewYearHolidaysStartDate(@year AS SMALLINT) RETURNS DATE
BEGIN
		DECLARE @new_year_date AS DATE = DATEFROMPARTS(@year,01,01);
		DECLARE @weekday AS TINYINT  = DATEPART(WEEKDAY,@new_year_date);
		DECLARE @start_date AS DATE = DATEADD(DAY,1-@weekday,@new_year_date);
		IF DATEPART(DAY,@start_date)=1
		BEGIN
			SET @start_date=DATEADD(DAY,-2,@start_date)
		END

		--PRINT ('GetNewYearHolidaysStartDate')
		--PRINT (@new_year_date);
		--PRINT(@weekday);
		--PRINT (DATENAME(WEEKDAY,@new_year_date))
		--PRINT('------------------------------')
		--PRINT(@start_date);
		RETURN (@start_date)
END