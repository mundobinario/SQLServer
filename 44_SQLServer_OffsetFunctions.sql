
SELECT [ProductID]
      ,[LocationID]
      ,[Shelf]
      ,[Bin]
      ,[Quantity]
	  ,LAG(Quantity) OVER(PARTITION BY ProductID ORDER BY ProductID)						AS [BeforeQty]
	  ,LEAD(Quantity) OVER(PARTITION BY ProductID ORDER BY ProductID)						AS [NextQty]
	  ,FIRST_VALUE(Quantity) OVER (PARTITION BY ProductID ORDER BY ProductID,Quantity  ASC)	AS [FirstValue]
	  ,LAST_VALUE(Quantity) OVER (PARTITION BY ProductID ORDER BY ProductID,Quantity ASC)	AS [LastValue]
  FROM [Production].[ProductInventory] 


SELECT 
	[v].[CreditRating]
	,MIN([potv].[Total]) AS [MinTotal]
	,MAX([potv].[Total]) AS [MaxTotal]
	,AVG([potv].[Total]) AS [AVGTotal]
FROM
	[dbo].[PuchaseOrderTotalByVendor] AS [potv]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [potv].[VendorID] = [v].[BusinessEntityID]
GROUP BY
	[v].[CreditRating]



SELECT 
	[potv].[VendorID]
	,[v].[CreditRating]
	,[potv].[Total]
	,FIRST_VALUE([potv].[Total]) OVER (PARTITION BY [v].[CreditRating] ORDER BY [v].[CreditRating], [potv].[Total] ASC) [MinTotal]
	,LAST_VALUE([potv].[Total]) OVER (PARTITION BY [v].[CreditRating] ORDER BY [v].[CreditRating] ASC) AS [MaxTotal]
FROM
	[dbo].[PuchaseOrderTotalByVendor] AS [potv]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [potv].[VendorID] = [v].[BusinessEntityID]
ORDER BY
	[v].[CreditRating]
