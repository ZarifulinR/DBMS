USE PV_319_Import;
GO
--EXEC sp_PrintScheduleForGroup N'PV_319';
--EXEC sp_PrintScheduleForGroupPeriod N'PD_321','2024-06-01','2024-07-01';
--SELECT * FROM Schedule;
--SELECT =
-- FROM sys.procedures
--EXEC  sp_ScheduleForGroup N'PD_321', N'%MS SQL Server%', N'�������', N'2024-06-10', N'13:30'
---- WHERE name = 'sp_PrintScheduleForGroupPeriod';
--DECLARE @salary SMALLMONEY 
--EXEC @salary = sp_CountTeachersMonthSalary N'�������',2024,06
----EXEC @salary = sp_CountTeachersMonthSalary N'�������',2024,06
--PRINT (@salary)
--EXEC sp_ScheduleForGroup21_12 N'PD_321', N'%MS SQL Server%',N'%��������� ����������������%', N'�������', N'2024-06-10', N'13:30';