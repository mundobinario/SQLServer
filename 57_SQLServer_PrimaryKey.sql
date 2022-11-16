
--The identity column property
CREATE TABLE [Products_Identity]
(
	[ProductID]		INT PRIMARY KEY IDENTITY(1,1)
	,[ProductName]	VARCHAR(100) NOT NULL
)

INSERT INTO [Products_Identity]
VALUES
('Laptop ASUS')


--The sequence object
CREATE TABLE [Products_Sequence]
(
	[ProductID]		INT PRIMARY KEY 
	,[ProductName]	VARCHAR(100) NOT NULL
)

CREATE SEQUENCE [dbo].[AutoIncrement]
AS INT
START WITH 2
INCREMENT BY 2

SELECT NEXT VALUE FOR [dbo].[AutoIncrement]

INSERT INTO [dbo].[Products_Sequence]
VALUES
(
	NEXT VALUE FOR [dbo].[AutoIncrement]
	,'Laptop HP PRO MAX'
)

--Nonsequential GUIDs 
CREATE TABLE [Products_Nonsequential]
(
	[ProductID]		UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID()
	,[ProductName]	VARCHAR(100) NOT NULL
)



INSERT INTO [Products_Nonsequential]
VALUES
(
	NEWID()
	,'Laptop DELL'
)

--Sequential GUIDs
CREATE TABLE [Products_Sequential]
(
	[ProductID]		UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID()
	,[ProductName]	VARCHAR(100) NOT NULL
)


INSERT INTO [Products_Sequential]
VALUES
(
	DEFAULT
	,'Laptop HP PRO MAX'
)

SELECT [ProductID], [ProductName] FROM [Products_Nonsequential]
SELECT [ProductID], [ProductName] FROM [Products_Sequential]












--Custom solutions
CREATE TABLE [Products_Custom]
(
	[ProductID]		INT PRIMARY KEY 
	,[ProductName]	VARCHAR(100) NOT NULL
)

DECLARE @consecutive AS INT

SELECT @consecutive = ISNULL(MAX([ProductID]),0) + 1 FROM [Products_Custom]

INSERT INTO [Products_Custom]
VALUES
(
	@consecutive
	,'Laptop ASUS'
)