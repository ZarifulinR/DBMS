USE PV_319_Import;
SET DATEFIRST 1;
GO
ALTER FUNCTION CountSpentLessons
(
	@group_name AS NVARCHAR(10),
	@discipline_name AS NVARCHAR(150)
)
RETURNS TINYINT
BEGIN 
	DECLARE @group AS INT = dbo.GetGroupID(@group_name)
	--dbo.GetGroupID
	DECLARE @discipline AS SMALLINT =  dbo.GetDisciplineID(@discipline_name)
	RETURN (SELECT COUNT(lesson_id) FROM Schedule WHERE [group]=@group AND discipline LIKE @discipline AND spent=1)
	END