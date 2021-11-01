--;WITH CTE_PurchaseOrderDetail AS
--(
--	SELECT
--		ROW_NUMBER() 
--			OVER(PARTITION BY [purchaseOrderID] 
--			ORDER BY [pod].[purchaseOrderID] ) 
--							AS [Consecutivo]
--		,[pod].[ProductID]	AS [ClaveDeProducto]
--		,[pod].[UnitPrice]	AS [Precio]
--	FROM 
--		[Purchasing].[PurchaseOrderDetail] AS [pod]
--	WHERE 
--		[PurchaseOrderID] = 18
--)

--SELECT * FROM CTE_PurchaseOrderDetail
--WHERE [Consecutivo] <= 3

--SELECT * FROM [Purchasing].[ProductVendor]












--;WITH CTE_SOH AS
--(
--	SELECT
--		[soh].[SalesOrderID]
--		,[soh].[OrderDate]
--		,[soh].[Status]
--		,[soh].[SalesOrderNumber]
--		,[soh].[AccountNumber]
--		,[soh].[TotalDue]
--	FROM 
--		[Sales].[SalesOrderHeader] AS [soh]	
--	WHERE 
--		[soh].[AccountNumber] LIKE '10-4020%' AND TotalDue >= 50000
--)

--,CTE_product AS
--(
--	SELECT 
--		[p].[ProductID]
--	FROM 
--		[Production].[Product] AS [p]
--	WHERE 
--		[p].[MakeFlag] = 1
--		AND [p].[Color] = 'Red'
--)

--,CTE_SOHD AS
--(
--	SELECT
--		[sohd].[SalesOrderDetailID]
--		,[sohd].[SalesOrderID]
--		,[sohd].[ProductID]
--		,[sohd].[UnitPrice]
--	FROM
--		[Sales].[SalesOrderDetail] AS [sohd]
--	--WHERE 
--	--	[ProductID] IN (SELECT ProductID FROM CTE_product)
--)


----2,760

--SELECT 
--	* 
--FROM 
--	CTE_SOH AS [soh]
--	INNER JOIN CTE_SOHD AS [sohd]
--		ON [soh].[SalesOrderID] = [sohd].[SalesOrderID]
--	INNER JOIN CTE_product AS [p]
--		ON [sohd].[ProductID] = [p].ProductID


-- CTE The same result, diferent source.



;WITH CTE_ProductM
AS
(
	SELECT 
		[p].[ProductID]
		,[p].[Name]
		,[p].[Color]
		,[p].[Class]
		,'SourceM'			AS [Source]
	FROM
		[Production].[Product] AS [p]
	WHERE
		[p].[Class] = 'M'
)
, CTE_ProductL
AS
(
	SELECT 
		[p].[ProductID]
		,[p].[Name]
		,[p].[Color]
		,[p].[Class]
		,'SourceL'			AS [Source]
	FROM
		[Production].[Product] AS [p]
	WHERE
		[p].[Class] = 'L'
)

SELECT [u].[ProductID], [u].[Source]
FROM
	(
		SELECT [ProductID], [Name], [Color], [Class], [Source] FROM CTE_ProductM
		UNION ALL
		SELECT [ProductID], [Name], [Color], [Class], [Source] FROM CTE_ProductL
	) AS [u]
WHERE
	[u].[Source] = 'SourceL'