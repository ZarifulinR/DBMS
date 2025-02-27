USE PV_319_Import;
SET DATEFIRST 1
GO
--EXEC sp_PrintScheduleForGroup N'PV_319';
--EXEC sp_PrintScheduleForGroupPeriod N'PD_321','2024-06-01','2024-07-01';
--SELECT * FROM Schedule;
--SELECT =
-- FROM sys.procedures
--EXEC  sp_ScheduleForGroup N'PD_321', N'%MS SQL Server%', N'Покидюк', N'2024-06-10', N'13:30'
---- WHERE name = 'sp_PrintScheduleForGroupPeriod';
--DECLARE @salary SMALLMONEY 
--EXEC @salary = sp_CountTeachersMonthSalary N'Покидюк',2024,06
----EXEC @salary = sp_CountTeachersMonthSalary N'Покидюк',2024,06
--PRINT (@salary)
--EXEC sp_ScheduleForGroup21_12 N'PD_321', N'%MS SQL Server%',N'%Системное программирование%', N'Покидюк', N'2024-06-10', N'13:30';
--DROP PROC sp_ScheduleForBaseStacionarGroup
--EXEC sp_ScheduleForBaseStacionarGroup N'PV_319', N'%Процедурное программирование%', N'Ковтун', N'2023-11-23','18:30',4,2,1
--EXEC sp_ScheduleForBaseStacionarGroup N'PV_319', N'%Процедурное%', N'%Ковтун%', N'2023-11-23','18:30',4,2,1
--drop table Holidays