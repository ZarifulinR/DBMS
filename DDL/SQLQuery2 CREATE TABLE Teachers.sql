USE PV_319_DDL
GO
IF OBJECT_ID ('Teachers','U') IS NULL
 BEGIN 
CREATE TABLE Teachers
(
	teachers_id			INT			PRIMARY KEY,
	last_name			VARCHAR(50)		    NOT NULL,	
	first_name			VARCHAR(50)		   	NOT NULL,
	middle_name			VARCHAR(50)			   NULL	,
	birth_date			DATE				
);
END
GO