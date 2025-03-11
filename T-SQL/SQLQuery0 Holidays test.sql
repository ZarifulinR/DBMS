USE PV_319_Import
SET DATEFIRST 1
GO
EXEC sp_AddHolidays 2025, N'Май%'
SELECT 
		[Дата] = [date],
		[Праздник]= holiday_name
FROM DaysOFF,Holidays
WHERE holiday = holiday_id