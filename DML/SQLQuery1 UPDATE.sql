USE PV_319_DDL;
GO
UPDATE Groups SET direction =2 WHERE group_id= 4;
UPDATE Groups SET direction =3 WHERE group_id= 5 OR group_id=6;
UPDATE Groups SET direction =4 WHERE group_id= 8;
SELECT * FROM Groups;