USE PV_319_Import
GO
ALTER FUNCTION GetHolidayStartDate(@holiday NVARCHAR(150),@year SMALLINT) RETURNS DATE
BEGIN 
	DECLARE @month AS TINYINT = (SELECT [month] FROM Holidays WHERE holiday_name LIKE @holiday)
	DECLARE @day AS TINYINT = (SELECT [day] FROM Holidays WHERE holiday_name LIKE @holiday)
	DECLARE @start_date AS DATE =
	CASE 
	WHEN @holiday LIKE N'Нов%' THEN  dbo.GetNewYearHolidaysStartDate(@year) 
	wHeN @holiday LIke N'Лет%'	THEN  dbo.GetSummerHolidaysStart(@year)
	WHEN @holiday LIKE N'Па%' THEN dbo.GetEasterDate(@year)
	WHEN @month!=0 AND @day!=0 THEN DATEFROMPARTS(@year,@month,@day)
	END
	--SET @start_date = DATEFROMPARTS()
	RETURN @start_date
END