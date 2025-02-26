USE PV_319_Import;

GO
CREATE TABLE Holidays
				(holiday_id  SMALLINT	IDENTITY	PRIMARY KEY,
				 holiday_date DATE			NOT NULL,
				 description NVARCHAR(150)	NULL
				 )
