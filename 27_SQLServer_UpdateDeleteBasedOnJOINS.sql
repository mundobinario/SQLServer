SELECT  
	[sod].*
FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
	INNER JOIN [Sales].[Customer] AS [c]
		ON [soh].[CustomerID] = [c].[CustomerID]
	INNER JOIN [Sales].[SalesTerritory] AS [st]
		ON [c].[TerritoryID] = [st].[TerritoryID]
WHERE 
	[st].[Group] = 'Europe' AND [sod].[ProductID] = 750



UPDATE [sod]
SET [sod].[UnitPrice] = 4000
FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
	INNER JOIN [Sales].[Customer] AS [c]
		ON [soh].[CustomerID] = [c].[CustomerID]
	INNER JOIN [Sales].[SalesTerritory] AS [st]
		ON [c].[TerritoryID] = [st].[TerritoryID]
WHERE 
	[st].[Group] = 'Europe' AND [sod].[ProductID] = 750





SELECT  
	[sod].*
FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
	INNER JOIN [Sales].[Customer] AS [c]
		ON [soh].[CustomerID] = [c].[CustomerID]
WHERE 
	[c].[CustomerID] = 17026



DELETE FROM [sod]
FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
	INNER JOIN [Sales].[Customer] AS [c]
		ON [soh].[CustomerID] = [c].[CustomerID]
WHERE 
	[c].[CustomerID] = 17026


--TRUNCATE vs DELETE 
