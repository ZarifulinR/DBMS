USE PV_319_Import
SET DATEFIRST 1;
GO
ALTER PROCEDURE sp_AddAllHolidaysFor @year AS SMALLINT
AS
BEGIN
	EXEC sp_AddHolidays @year, N'Нов%';
	EXEC sp_AddHolidays @year, N'23%';
	EXEC sp_AddHolidays @year,N'8%';
	EXEC sp_AddHolidays @year, N'Пас%';
	EXEC sp_AddHolidays @year, N'Лет%';
	EXEC sp_AddHolidays @year, N'Де%';
END