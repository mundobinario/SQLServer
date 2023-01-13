--List of schemas
SELECT * FROM sys.schemas


--Create Schema
CREATE SCHEMA HumanResources

--Create table into schema
CREATE TABLE HumanResources.Employees
(
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [nvarchar](max) NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL
)

--Delete schema
DROP SCHEMA HumanResources

--Delete table
DROP TABLE HumanResources.Employees

--Change Schema
ALTER SCHEMA HumanResources TRANSFER dbo.Employees;
ALTER SCHEMA HumanResources TRANSFER dbo.EmployeeTerritories;
--ALTER SCHEMA dbo TRANSFER HumanResources.Employees;