USE PV_319_DDL
--CREATE TABLE Disciplines
--(
--	disciplin_id SMALLINT PRIMARY KEY ,
--	discipline_name NVARCHAR(150)	NOT NULL,
--	number_of_lessons TINYINT		NOT NULL
--);
--CREATE TABLE TeacherDisciplinesRelation
--(
--	teacher INT,
--	discipline SMALLINT,
--	PRIMARY KEY (teacher ,discipline),
--	 CONSTRAINT FK_TDR_teacher_2_Teachers		FOREIGN KEY (teacher) REFERENCES Teachers(teachers_id),
--	 CONSTRAINT FK_TDR_disciplines			  FOREIGN KEY (discipline) REFERENCES Disciplines(disciplin_id)
--);
--CREATE TABLE DisciplinesDirectionsRelation
--(
--	discipline SMALLINT,
--	direction TINYINT,
--	PRIMARY KEY (discipline,direction),
--	CONSTRAINT FK_DDR_discipline_2_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplines(disciplin_id),
--	CONSTRAINT FK_DDR_direction_2_Directions FOREIGN KEY (direction) REFERENCES Directions(direction_id),
--);
--CREATe TABLE RequiredDisciplines
--(
--		discipline SMALLINT,
--		required_discipline SMALLINT,
--		PRIMARY KEY (discipline,required_discipline),
--		CONSTRAINT FK_RD_discipline_2_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplines(disciplin_id),
--		CONSTRAINT FK_RD_required_2_Disciplines FOREIGN KEY (required_discipline) REFERENCES Disciplines(disciplin_id)
--		--FK-ForeignKey( ������� ����)
--		--RD -ReqiredDisciplines;
--		--disciplines -��� ���� ������� �������� ������� ������
--		--2_Disciplines - ����������, �� ����� ������� ��������� ������� ����
--);
CREATE TABLE CompleteDisciplines
(
	discipline		SMALLINT,
	[group]			INT,
	PRIMARY KEY (discipline,[group]),
	constraint FK_CompleteDisciplines_Disciplines	 FOREIGN KEY (discipline)	REFERENCes Disciplines(disciplin_id),
	CONSTRAINT FK_CompleteDisciplines_Groups		 FOREIGN KEY ([group])      REFERENCES Groups(group_id)
);