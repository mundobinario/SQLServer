SELECT [o].[order_number]			AS 'Order Number'
	,[o].[order_date]				AS 'Order Date'
	,[od].[orderDetail_number]		AS 'Item'
	,[p].[product_code]				AS 'Product Code'
	,[p].[product_description]		AS 'Product Description'
	,[od].[orderDetail_quantity]	AS 'Qty'
	,[m].[measure_description]		AS 'Unit'
	,[od].[orderDetail_price]		AS 'Price'
FROM 
	[dbo].[Orders] AS [o]
	INNER JOIN [dbo].[OrderDetails] AS [od]
		ON [o].[order_id] = [od].[order_id]
	INNER JOIN [dbo].[Products] AS [p]
		ON [p].[product_id] = [od].[product_id]
	INNER JOIN [dbo].[Measures] AS [m]
		ON [m].[measure_id] = [od].[measure_id]