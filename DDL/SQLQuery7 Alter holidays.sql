USE PV_319_Import
GO


ALTER TABLE Holidays
ALTER COLUMN duration TINYINT NOT NULL


ALTER TABLE Holidays
--ADD [start_date] DATE
--DROP COLUMN [start_date] 
ADD [month] TINYINT,
	 [day] TINYINT