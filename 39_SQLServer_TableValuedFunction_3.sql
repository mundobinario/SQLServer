DECLARE @productID			AS INT =937
DECLARE @qty				AS INT = 0
DECLARE @bod				AS INT = 6

SELECT @qty= SUM(sod.OrderQty)FROM [Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
WHERE 
	[sod].[ProductID] = @productID 
	AND OrderDate >= '2013-05-30'
GROUP BY 
 sod.ProductID

--SELECT @qty

 IF (@qty <= (SELECT TotalStockQuantity FROM [dbo].[Inventory](@productID) WHERE LocationID= @bod))
 BEGIN
	PRINT 'DISPONIBLE'
END
ELSE
BEGIN
	PRINT 'NO DISPONIBLE'
END




--SELECT * FROM [dbo].[Inventory](937)