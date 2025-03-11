USE PV_319_Import
GO
CREATE FUNCTION dbo.GetHolidayID(@holiday_name NVARCHAR(150))RETURNS TINYINT 
BEGIN 
	RETURN (SELECT holiday_id FROM Holidays WHERE holiday_name LIKE @holiday_name)
END