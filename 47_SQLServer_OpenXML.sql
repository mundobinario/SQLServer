--SELECT
--	[poh].[VendorID]	AS [VendorID]
--	,[v].[Name]			AS [Vendor]
--	,FORMAT([poh].[PurchaseOrderID],'000000') AS [PONumber]
--	,[sm].[Name]		AS [ShippingMethod]
--	,[poh].[TotalDue]	AS [Total]
--	,ROW_NUMBER() OVER(PARTITION BY [poh].[PurchaseOrderID] ORDER BY [poh].[PurchaseOrderID] )	AS [Item]
--	,[p].[Name]			AS [Product]
--	,[pod].[OrderQty]	AS [Qty]
--	,[pod].[UnitPrice]	AS [Price]
--	,[pod].[LineTotal]	AS [Amount]
--FROM 
--	[Purchasing].[PurchaseOrderHeader] AS [poh]
--	INNER JOIN [Purchasing].[Vendor] AS [v]
--		ON [poh].[VendorID] = [v].[BusinessEntityID]
--	INNER JOIN [Purchasing].[ShipMethod] AS [sm]
--		ON [poh].[ShipMethodID] = [sm].[ShipMethodID]
--	INNER JOIN [Purchasing].[PurchaseOrderDetail] AS [pod]
--		ON [poh].[PurchaseOrderID] = [pod].[PurchaseOrderID]
--	INNER JOIN [Production].[Product] AS [p]
--		ON [pod].[ProductID] = [p].[ProductID]
--WHERE
--	--[sm].[ShipMethodID] = 3
--	[poh].[PurchaseOrderID] = 165
----FOR XML RAW
--FOR XML AUTO, ELEMENTS, ROOT('PurchaseOrder'); 






--SELECT
--	[poh].[VendorID]	AS [VendorID]
--	,[v].[Name]			AS [Vendor]
--	,FORMAT([poh].[PurchaseOrderID],'000000') AS [PONumber]
--	,[sm].[Name]		AS [ShippingMethod]
--	,[poh].[TotalDue]	AS [Total]
--	,ROW_NUMBER() OVER(PARTITION BY [poh].[PurchaseOrderID] ORDER BY [poh].[PurchaseOrderID] )	AS [Item]
--	,[p].[Name]			AS [Product]
--	,[pod].[OrderQty]	AS [Qty]
--	,[pod].[UnitPrice]	AS [Price]
--	,[pod].[LineTotal]	AS [Amount]
--FROM 
--	[Purchasing].[PurchaseOrderHeader] AS [poh]
--	INNER JOIN [Purchasing].[Vendor] AS [v]
--		ON [poh].[VendorID] = [v].[BusinessEntityID]
--	INNER JOIN [Purchasing].[ShipMethod] AS [sm]
--		ON [poh].[ShipMethodID] = [sm].[ShipMethodID]
--	INNER JOIN [Purchasing].[PurchaseOrderDetail] AS [pod]
--		ON [poh].[PurchaseOrderID] = [pod].[PurchaseOrderID]
--	INNER JOIN [Production].[Product] AS [p]
--		ON [pod].[ProductID] = [p].[ProductID]
--WHERE

--	[poh].[PurchaseOrderID] = 165
--FOR XML PATH ('PurchaseOrder'), TYPE











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


--SELECT
--	[poh].[VendorID]	AS [VendorID]
--	,[v].[Name]			AS [Vendor]
--	,FORMAT([poh].[PurchaseOrderID],'000000') AS [PONumber]
--	,[sm].[Name]		AS [ShippingMethod]
--	,[poh].[TotalDue]	AS [Total]
--	,(
--		SELECT 
--			ROW_NUMBER() OVER(PARTITION BY [poh].[PurchaseOrderID] ORDER BY [poh].[PurchaseOrderID] )	AS [Item]
--			--ROW_NUMBER() OVER(PARTITION BY [poh].[PurchaseOrderID] ORDER BY [poh].[PurchaseOrderID] )	AS [@Item]
--			--ROW_NUMBER() OVER(PARTITION BY [poh].[PurchaseOrderID] ORDER BY [poh].[PurchaseOrderID] )	AS [Item/@Item]
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
--FOR XML PATH('Orders'), ROOT('PurchaseOrder');


