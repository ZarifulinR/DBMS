USE PV_319_Import;
----DROP TABLE Holidays;
--CREATE TABLE Holidays
--(
--		holiday_id TINYINT PRIMARY KEY,
--		holiday_name NVARCHAR(150) NOT NULL,
--);
--GO
--INSERT Holidays
--		(holiday_id, holiday_name)
--VALUES
--		(1, N'Новогодние каникулы'),
--		(2, N'23 февраля'),
--		(3, N'8 марта'),
--		(4,N'Пасха'),
--		(5, N'Майские каникулы'),
--		(6, N'Летние каникулы'),
--		(7, N'Дент народного единства')
--ALTER TABLE Holidays
--ADD		duration TINYINT 
--GO

UPDATE  Holidays 					SET duration = 14 WHERE holiday_id=1
UPDATE  Holidays 					SET duration =  3 WHERE holiday_id=2
UPDATE  Holidays					SET duration =  3 WHERE holiday_id=3
UPDATE  Holidays					SET duration =  3 WHERE holiday_id=4
UPDATE  Holidays					SET duration = 10 WHERE holiday_id=5
UPDATE  Holidays					SET duration = 14 WHERE holiday_id=6
UPDATE  Holidays					SET duration =  4 WHERE holiday_id=7
SELECT * FROM Holidays