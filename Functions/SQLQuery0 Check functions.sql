USE PV_319_Import
SET DATEFIRST 1;
GO
--EXEC sp_PrintScheduleForGroup N'PV_319'
PRINT (dbo.GetGroupID(N'PV_319'))
PRINT (dbo.GetDisciplineID(N'������ ��� ������, ���������������� MS SQL Server%'))
PRINT (dbo.CountSpentLessons(N'PV_319',N'����������� ����������������%'))
PRINT (dbo.GetNewYearHolidaysStartDate(2024))
PRINT (dbo.GetSummerHolidaysStart(2024))