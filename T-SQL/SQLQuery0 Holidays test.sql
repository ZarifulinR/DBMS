USE PV_319_Import
SET DATEFIRST 1
GO
--EXEC sp_AddAllHolidaysFor 2024
SELECT 
		[Дата] = [date],
		[Праздник]= holiday_name
FROM DaysOFF,Holidays
WHERE holiday = holiday_id