USE PV_319_Import;
GO
--EXEC sp_PrintScheduleForGroup N'PV_319';
--EXEC sp_PrintScheduleForGroupPeriod N'PV_319','2024-06-01','2024-07-01';
--SELECT * FROM Schedule;
--SELECT =
-- FROM sys.procedures
-- WHERE name = 'sp_PrintScheduleForGroupPeriod';
DECLARE @salary SMALLMONEY 
EXEC @salary = sp_CountTeachersMonthSalary N'Ковтун',2024,06
PRINT (@salary)