USE DBMS_One_request;
GO
IF NOT EXISTS( SELECT * FROM sys.databases WHERE name = 'DBMS_One_Request')
BEGIN CREATE DATABASE DBMS_One_Reques
		ON 
(
		 NAME =PV_319_DDL,
		 FILENAME = 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBMS_One_Reques.mdf',
		 SIZE = 8 MB,
		 MAXSIZE = 512 MB,
		 FILEGROWTH =8 MB
 )
	
	LOG ON 
 (
		NAME = PV_319_DDL_Log,
		FILENAME = 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_319_DLL_Log.ldf',
		SIZE = 8 MB,
		MAXSIZE = 512 MB,
		FILEGROWTH = 8 MB
);
	
END
GO
USE DBMS_One_request;

	IF OBJECT_ID('Disciplines','U') IS NULL
	BEGIN 
	CREATE TABLE Disciplines
(
	disciplin_id SMALLINT PRIMARY KEY ,
	discipline_name NVARCHAR(150)	NOT NULL,
	number_of_lessons TINYINT		NOT NULL
);
	END
	GO
		IF OBJECT_ID ('Directions','U') IS NULL
		BEGIN  
	CREATE TABLE Directions
 (
	direction_id TINYINT PRIMARY KEY,
	direction_name NVARCHAR(256) NOT NULL

 );
 END
 
 IF OBJECT_ID ('Teachers','U') IS NULL
 BEGIN 
	CREATE TABLE Teachers
(
	teachers_id			INT			PRIMARY KEY,
	last_name			VARCHAR(50)		    NOT NULL,	
	fisrt_name			VARCHAR(50)		   	NOT NULL,
	middle_name			VARCHAR(50)			   NULL	,
	birth_date			DATE				NOT NULL
);
END
GO
		IF OBJECT_ID ('TeacherDisciplinesRelation','U') IS NULL
	BEGIN
	CREATE TABLE TeacherDisciplinesRelation
	(
			teacher INT,
			discipline SMALLINT,
			PRIMARY KEY (teacher ,discipline),
			CONSTRAINT FK_TDR_teacher_2_Teachers		FOREIGN KEY (teacher) REFERENCES Teachers(teachers_id),
			CONSTRAINT FK_TDR_disciplines			  FOREIGN KEY (discipline) REFERENCES Disciplines(disciplin_id)
	);
	END
	GO
	IF OBJECT_ID ('DisciplinesDirectionsRelation','U') IS NULL
	BEGIN
	CREATE TABLE DisciplinesDirectionsRelation
(
	discipline SMALLINT,
	direction TINYINT,
	PRIMARY KEY (discipline,direction),
	CONSTRAINT FK_DDR_discipline_2_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplines(disciplin_id),
	CONSTRAINT FK_DDR_direction_2_Directions FOREIGN KEY (direction) REFERENCES Directions(direction_id),
);
	END
	GO
	IF OBJECT_ID ('RequiredDisciplines','U') IS NULL
	BEGIN 
	CREATe TABLE RequiredDisciplines
(
		discipline SMALLINT,
		required_discipline SMALLINT,
		PRIMARY KEY (discipline,required_discipline),
		CONSTRAINT FK_RD_discipline_2_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplines(disciplin_id),
		CONSTRAINT FK_RD_required_2_Disciplines FOREIGN KEY (required_discipline) REFERENCES Disciplines(disciplin_id)
		
);
	END
	GO
	IF OBJECT_ID('Groups','U') IS NULL
	BEGIN
		CREATE TABLE Groups
			(
				group_id		INT		PRIMARY KEY,
				group_name		VARCHaR(16)		NOT NULL,
				direction TINYINT NOT NULL
				CONSTRAINT FK_Groups_Directions FOREIGN KEY REFERENCES Directions(direction_id)
		)
		END
		GO

	IF OBJECT_ID('Students','U') IS NULL
	BEGIN 
		CREATE TABLE Students
			(
			student_id		INT			PRIMARY KEY,
			last_name		NVARCHAR(50)				NOT NULL,
			first_name		NVARCHAR(50)				NOT NULL,
			middle_name		NVARCHAR(50)					NULL,
			birth_date		DATE						NOT NULL,
			[group]			INT							NOT NULL
			CONSTRAINT FK_Students_Groups	FOREIGN KEY REFERENCES Groups(group_id) 
			);

		END
		GO


	IF OBJECT_ID ('CompleteDisciplines','U') IS NULL
	BEGIN 
		CREATE TABLE CompleteDisciplines
(
	discipline		SMALLINT,
	[group]			INT,
	PRIMARY KEY (discipline,[group]),
	constraint FK_CompleteDisciplines_Disciplines	 FOREIGN KEY (discipline)	REFERENCes Disciplines(disciplin_id),
	CONSTRAINT FK_CompleteDisciplines_Groups		 FOREIGN KEY ([group])      REFERENCES Groups(group_id)
);
END
GO
IF OBJECT_ID ('Schedule','U') IS NULL
	BEGIN 
					CREATE TABLE Schedule
			(
				lesson_id			BIGINT			PRIMARY KEY,
				[date]				date			NOT NULL,
				[time]				TIME			NOT NULL,
				[group]				int				NOT NULL
				CONSTRAINT FK_Schedule_Group		FOREIGN KEY REFERENCES Groups(group_id),
				discipline			SMALLINT		NOT NULL 
				CONSTRAINT FK_Schedule_Discipline	FOREIGN KEY REFERENCES Disciplines(disciplin_id),
				teacher				INT				NOT NULL 
				CONSTRAINT FK_Schedule_Teachers		FOREIGN KEY REFERENCES Teachers(teachers_id),
				[subject]			NVARCHAR(256)	NOT NULL,
				spent				BIT					NULL,
			);
END
GO
IF OBJECT_ID ('Grades','u') IS NULL
BEGIN 
	CREATE TABLE Grades
		(
	student	INT						CONSTRAINT FK_Grades_Student FOREIGN KEY REFERENCES Students(student_id),
	lesson	BIGINT					CONSTRAINT FK_Grades_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
	present	BIT				NULL,
	grade_1	TINYINT			NULL	CONSTRAINT CK_Graid_1 CHECK (grade_1>0 AND grade_1<=12),
	grade_2	TINYINT			NULL	CONSTRAINT CK_Graid_2 CHECK (grade_2>0 AND grade_2<=12)
);
END
GO
	IF OBJECT_ID ('Exam','U') IS NULL
	BEGIN 
		CREATE TABLE Exam
			(
				student			INT		
							CONSTRAINT FK_Exam_Students FOREIGN KEY REFERENCES Students(student_id),
				lesson			BIGINT 
							CONSTRAINT Fk_Exam_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
							PRIMARY KEY (student,lesson),
				grade		TINYINT 
							CONSTRAINT FK_Exam_Grade CHECK(grade>0 AND grade<12) 
			);
END
GO