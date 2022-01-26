SELECT 
	--[v].[Name]
	[poh].[ShipMethodID]
	,MIN(poh.TotalDue)		AS MinTotal
	,MAX(poh.TotalDue)		AS MaxTotal
	,COUNT(poh.TotalDue)	AS MaxTotal
	,AVG(poh.TotalDue)		AS AVGTotal
FROM [Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [v].[BusinessEntityID] = [poh].[VendorID]
GROUP BY
	[poh].[ShipMethodID]
	--,[v].[Name]



SELECT 
	[poh].[VendorID]
	,[v].[Name]
	,[poh].[ShipMethodID]
	,MIN(poh.TotalDue) OVER(PARTITION BY [poh].[ShipMethodID])		AS [MinTotal]
	,MAX(poh.TotalDue) OVER(PARTITION BY [poh].[ShipMethodID])		AS [MaxTotal]
	,COUNT(poh.TotalDue) OVER(PARTITION BY [poh].[ShipMethodID])	AS [CountTotal]
	,AVG(poh.TotalDue) OVER(PARTITION BY [poh].[ShipMethodID])		AS [AVGTotal]
FROM 
	[Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [v].[BusinessEntityID] = [poh].[VendorID]



-- Example products

SELECT 
	[LocationID]
	,[Bin]
	,SUM([Quantity])
FROM 
	[Production].[ProductInventory]
GROUP BY
	[LocationID]
	,[Bin]
ORDER BY
	[LocationID]
	,[Bin]



SELECT 
	   [ProductID]
      ,[LocationID]
      ,[Bin]
      ,[Quantity]
      ,SUM(Quantity) OVER(PARTITION BY [LocationID], [Bin]) AS [Partition]
FROM 
	[Production].[ProductInventory]



	