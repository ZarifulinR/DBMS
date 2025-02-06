USE PV_319_DDL;
GO
--CREATE TABLE Schedule
--(
--	lesson_id			BIGINT			PRIMARY KEY,
--	[date]				date			NOT NULL,
--	[time]				TIME			NOT NULL,
--	[group]				int				NOT NULL
--	CONSTRAINT FK_Schedule_Group		FOREIGN KEY REFERENCES Groups(group_id),
--	discipline			SMALLINT		NOT NULL 
--	CONSTRAINT FK_Schedule_Discipline	FOREIGN KEY REFERENCES Disciplines(disciplin_id),
--	teacher				INT				NOT NULL 
--	CONSTRAINT FK_Schedule_Teachers		FOREIGN KEY REFERENCES Teachers(teachers_id),
--	[subject]			NVARCHAR(256)	NOT NULL,
--	spent				BIT					NULL,
--);
CREATE TABLE Grades
(
	student			 INT			
						CONSTRAINT FK_Grades_Student FOREIGN KEY REFERENCES Students(student_id),
	lesson			BIGINT		
						CONSTRAINT FK_Grades_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
	present			BIT				NULL,
	grade_1			TINYINT			NULL
						CONSTRAINT CK_Graid_1 CHECK (grade_1>0 AND grade_1<=12),
	grade_2			TINYINT			NULL
	CONSTRAINT CK_Graid_2 CHECK (grade_2>0 AND grade_2<=12)
);
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