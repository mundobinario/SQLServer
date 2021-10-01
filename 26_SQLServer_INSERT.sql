-- INSERT INTO

CREATE TABLE [Sales].[SalesOrderHeaderBakckup]
	(
		[SalesOrderID]	INT			NOT NULL	PRIMARY KEY
		,[OrderDate]	DATETIME	NOT NULL
		,[ShipDate]		DATETIME	NULL
		,[CustomerID]	INT			NOT NULL
		,[Status]		TINYINT		NOT NULL
		,[TotalDue]		MONEY		NOT NULL
		,[TaxAmt]		MONEY		NOT NULL
	)


INSERT INTO [Sales].[SalesOrderHeaderBakckup]
	([SalesOrderID], [OrderDate], [ShipDate], [CustomerID], [Status], [TotalDue])
SELECT 
	[SalesOrderID], [OrderDate], [ShipDate], [CustomerID], [Status], [TotalDue]
FROM 
	[Sales].[SalesOrderHeader]
WHERE
	[TotalDue] >= 500


DELETE FROM [Sales].[SalesOrderHeaderBakckup]




-- INSERT EXEC
INSERT INTO [Sales].[SalesOrderHeaderBakckup]
	EXEC Sales.SalesOrderByCustomerID @CustomerID = 29825


SELECT * FROM [Sales].[SalesOrderHeaderBakckup]

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE CustomerID=29825 AND TaxAmt >= 2500






-- SELECT INTO 
DROP TABLE IF EXISTS [Sales].[SalesOrderHeaderBakckup]; 

SELECT 
	[SalesOrderID], [OrderDate], [ShipDate], [CustomerID], [Status], [TotalDue], [TaxAmt]
INTO
	[Sales].[SalesOrderHeaderBackup]
FROM 
	[Sales].[SalesOrderHeader]
WHERE
	[TotalDue] >= 150000;