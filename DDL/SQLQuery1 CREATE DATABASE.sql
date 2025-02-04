--Transact -SQL
CREATE DATABASE PV_319_DDL
	ON 
(
		 NAME =PV_319_DDL,
		 FILENAME = 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_319_DDL.mdf',
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
	 GO