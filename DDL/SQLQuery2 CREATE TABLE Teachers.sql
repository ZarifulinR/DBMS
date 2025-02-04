USE PV_319_DDL
GO
CREATE TABLE Teachers
(
	teachers_id			INT			PRIMARY KEY,
	last_name			VARCHAR(50)		    NOT NULL,	
	fisrt_name			VARCHAR(50)		   	NOT NULL,
	middle_name			VARCHAR(50)			   NULL	,
	birth_date			DATE				NOT NULL
);