USE PV_319_Import
GO
SET DATEFIRST 1;
--CREATE PROCEDURE sp_AddNewYearHolidaysFor
--	@year	AS		SMALLINT
--BEGIN
--	DECLARE 2start_date AS DATE  = DATEADD
--END
DECLARE @new_year_date AS DATE = DATEFROMPARTS(2025,01,01);
DECLARE @weekday AS TINYINT  = DATEPART(WEEKDAY,@new_year_date);
DECLARE @start_date AS DATE = DATEADD(DAY,1-@weekday,@new_year_date);
PRINT (@new_year_date);
PRINT(@weekday);
PRINT(@start_date);