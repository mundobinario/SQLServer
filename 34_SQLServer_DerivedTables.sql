SELECT * FROM 
(
	SELECT
		ROW_NUMBER() OVER(PARTITION BY [purchaseOrderID] ORDER BY [pod].[purchaseOrderID] ) AS 'Consecutive'
		,		* 
	FROM [Purchasing].[PurchaseOrderDetail] AS [pod]
	WHERE [pod].[PurchaseOrderID] = 18
) as [new]
WHERE [new].[Consecutive] <= 3










SELECT * FROM 
(
	SELECT
		ROW_NUMBER() OVER(PARTITION BY [purchaseOrderID] ORDER BY [pod].[purchaseOrderID] ) AS 'Consecutive'
		,		* 
	FROM [Purchasing].[PurchaseOrderDetail] AS [pod]
	--WHERE [pod].[PurchaseOrderID] = 18
) as [new]
WHERE [new].[Consecutive] <= 3