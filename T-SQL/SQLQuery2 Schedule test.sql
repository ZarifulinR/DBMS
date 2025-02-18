USE PV_319_Import;
GO
EXEC sp_ScheduleForGroup N'PV_319', N'Объектно-ориент%',N'Ковтун', N'2024-06-01',N'18:30';
EXEC sp_PrintScheduleForGroup N'PV_319';
--SELECT * FROM Schedule;