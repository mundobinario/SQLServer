--CREATE VIEW view_name AS
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition; 



    --We can use DML operation on a single table only
    --VIEW should not contain Group By, Having, Distinct clauses
    --We cannot use a subquery in a VIEW in SQL Server
    --We cannot use Set operators in a SQL VIEW

SELECT 
	[poh].[VendorID]
	,[v].[Name]
	,DATENAME(MONTH, ([poh].[OrderDate]))
	,SUM([poh].[TotalDue]) 
FROM	
	[Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [poh].[VendorID] = [v].[BusinessEntityID]
WHERE
	YEAR([OrderDate]) = 2014
GROUP BY
	[poh].[VendorID]
	,[v].[Name]
	,[poh].[OrderDate]


CREATE VIEW PuchaseOrderTotalByVendor
AS
(
	SELECT 
		[poh].[VendorID]
		,[v].[Name]
		,DATENAME(MONTH, ([poh].[OrderDate]))	AS 'Month'
		,[poh].[TotalDue]						AS 'Total'
		,[poh].[Status]							AS 'Status'
	FROM	
		[Purchasing].[PurchaseOrderHeader] AS [poh]
		INNER JOIN [Purchasing].[Vendor] AS [v]
			ON [poh].[VendorID] = [v].[BusinessEntityID]
	WHERE
		YEAR([OrderDate]) = 2014
);

DROP VIEW PuchaseOrderTotalByVendor

SELECT * FROM PuchaseOrderTotalByVendor

SELECT * FROM PuchaseOrderTotalByVendor
WHERE VendorID= 1624 AND Total=31268.7375 AND Month='August'

UPDATE PuchaseOrderTotalByVendor
SET Status=4
WHERE VendorID= 1624 AND Total=31268.7375 AND Month='August'

SELECT * FROM [Purchasing].[PurchaseOrderHeader] AS [poh]
WHERE TotalDue=31268.7375 AND VendorID=1624 AND MONTH(OrderDate)=8 AND YEAR(OrderDate)=2014


SELECT 
		[r].[VendorID]
		,[r].[Name]
		,[r].[Month]
		,SUM([r].[Total])					AS 'Total'
	FROM	
		PuchaseOrderTotalByVendor AS [r]
	GROUP BY
		[r].[VendorID]
		,[r].[Name]
		,[r].[Month]


SELECT 
		[poh].[VendorID]
		,[v].[Name]
		,DATENAME(MONTH, ([poh].[OrderDate]))	AS 'Month'
		,SUM([poh].[TotalDue])					AS 'Total'
	FROM	
		[Purchasing].[PurchaseOrderHeader] AS [poh]
		INNER JOIN [Purchasing].[Vendor] AS [v]
			ON [poh].[VendorID] = [v].[BusinessEntityID]
	WHERE
		YEAR([OrderDate]) = 2014
	GROUP BY
		[poh].[VendorID]
		,[v].[Name]
		,[poh].[OrderDate]