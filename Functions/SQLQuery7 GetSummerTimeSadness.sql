USE PV_319_Import;
SET DATEFIRST 1
GO
ALTER FUNCTION GetSummerHolidaysStart(@year AS SMALLINT) RETURNS DATE
BEGIN
	DECLARE @first_august AS DATE = DATEFROMPARTS(@year,08,1);
	DECLARE @weekday AS TINYINT =		DATEPART(WeEKDAY,@first_august)
	DECLARE @start_date AS DATE = DATEADD(DAY,-@weekday+1,@first_august)
	RETURN @start_date
END