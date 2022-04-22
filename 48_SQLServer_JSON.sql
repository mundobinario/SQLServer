SELECT 
	[AccountNumber]
	,[Name]
	,[CreditRating]
	,[ModifiedDate]
FROM 
	[Purchasing].[Vendor]
WHERE 
	[ActiveFlag] = 0
FOR JSON AUTO


SELECT 
	[v].[AccountNumber]
	,[v].[Name]
	,[poh].[PurchaseOrderID]
	,[poh].[ShipMethodID]
FROM
	[Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [v].[BusinessEntityID] = [poh].[VendorID]
WHERE 
	[v].[ActiveFlag] = 0 AND [OrderDate] <= '12-31-2012'
FOR JSON AUTO
--FOR JSON PATH


--SELECT
--	[poh].[VendorID]	AS [VendorID]
--	,[v].[Name]			AS [Vendor]
--	,FORMAT([poh].[PurchaseOrderID],'000000') AS [PONumber]
--	,[sm].[Name]		AS [ShippingMethod]
--	,[poh].[TotalDue]	AS [Total]
--	,(
--		SELECT 
--			ROW_NUMBER() OVER(PARTITION BY [poh].[PurchaseOrderID] ORDER BY [poh].[PurchaseOrderID] )	AS [Item]
--			,[p].[Name]			AS [Product]
--			,[pod].[OrderQty]	AS [Qty]
--			,[pod].[UnitPrice]	AS [Price]
--			,[pod].[LineTotal]	AS [Amount]
--		FROM 
--			[Purchasing].[PurchaseOrderDetail] AS [pod]
--			INNER JOIN [Production].[Product] AS [p]
--				ON [pod].[ProductID] = [p].[ProductID]
--		WHERE
--			[pod].[PurchaseOrderID] = [poh].[PurchaseOrderID]
--		FOR XML PATH('LineItem'), TYPE
--	)
--FROM 
--	[Purchasing].[PurchaseOrderHeader] AS [poh]
--	INNER JOIN [Purchasing].[Vendor] AS [v]
--		ON [poh].[VendorID] = [v].[BusinessEntityID]
--	INNER JOIN [Purchasing].[ShipMethod] AS [sm]
--		ON [poh].[ShipMethodID] = [sm].[ShipMethodID]
--WHERE

--	[poh].[PurchaseOrderID] = 165
--FOR XML PATH ('PurchaseOrder'), TYPE
----FOR JSON PATH
----FOR JSON PATH, ROOT ('PurchaseOrder')


--SELECT
--	1		AS 'ID'
--	,NULL	AS 'Name'
--FOR JSON PATH, INCLUDE_NULL_VALUES


DECLARE @json AS NVARCHAR(MAX)
SET @json = '[{"AccountNumber":"ADVANCED0001","Name":"Advanced Bicycles","CreditRating":5,"ModifiedDate":"2021-09-30T13:45:12.367"},{"AccountNumber":"MORGANB0001","Name":"Morgan Bike Accessories","CreditRating":5,"ModifiedDate":"2021-09-30T13:45:12.367"},{"AccountNumber":"GARDNER0001","Name":"Gardner Touring Cycles","CreditRating":1,"ModifiedDate":"2012-01-25T00:00:00"},{"AccountNumber":"CIRCUIT0001","Name":"Circuit Cycles","CreditRating":1,"ModifiedDate":"2011-12-24T00:00:00"},{"AccountNumber":"RELIANCE0001","Name":"Reliance Fitness, Inc.","CreditRating":2,"ModifiedDate":"2012-02-02T00:00:00"},{"AccountNumber":"PROSE0001","Name":"Proseware, Inc.","CreditRating":4,"ModifiedDate":"2011-05-09T00:00:00"}]'

--SELECT * FROM OpenJson(@json);


--SELECT 
--	*
--FROM 
--	OpenJson(@json)
--	WITH 
--	(
--		[AN] NVARCHAR(200) '$.AccountNumber',
--		[Name] NVARCHAR(200) '$.Name'
--	)


;WITH CTE_json
AS
(
	SELECT 
		[AN] 
		,[Name]
	FROM 
		OpenJson(@json)
		WITH 
		(
			[AN]	NVARCHAR(200) '$.AccountNumber',
			[Name]	NVARCHAR(200) '$.Name'
		)
)

SELECT [v].*
FROM 
	CTE_json AS [j]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [v].[AccountNumber] = [j].[AN]
