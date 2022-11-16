SELECT 
	BusinessEntityID
	,AccountNumber
	,Name
	,CreditRating
	,PreferredVendorStatus
	,ActiveFlag
	,PurchasingWebServiceURL
	,ModifiedDate
FROM  
	[Purchasing].[Vendor]
WHERE 
	[PurchasingWebServiceURL] IS NOT NULL





-- Obtener el nombre de las columnas de una tabla
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_SCHEMA = 'Purchasing'
	AND TABLE_NAME = 'Vendor'



SELECT 
	TOP 10 [VendorID], SUM(TotalDue) AS Total  
FROM 
	[Purchasing].[PurchaseOrderHeader]
GROUP BY
	[VendorID]
ORDER BY 
	SUM(TotalDue) DESC




SELECT 
	TOP 10 [VendorID], [Name], SUM(TotalDue) AS Total, [PurchasingWebServiceURL]   
FROM 
	[Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [poh].[VendorID] = [v].[BusinessEntityID]
WHERE
	[PurchasingWebServiceURL] IS NOT NULL
GROUP BY
	[VendorID]
	,[Name]
	,[PurchasingWebServiceURL] 
ORDER BY 
	SUM(TotalDue) DESC




-- ISNULL
SELECT 
	BusinessEntityID
	,AccountNumber
	,Name
	,CreditRating
	,PreferredVendorStatus
	,ActiveFlag
	,ISNULL(PurchasingWebServiceURL, 'Missing to implement WS') AS PurchasingWebServiceURL
	,ModifiedDate
FROM  [Purchasing].[Vendor]






--COALESCE
SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[Class]
      ,[Style]
	  ,[Color]
	  ,COALESCE([Class],[Style],[Color],'NA') AS 'Additional'
FROM [Production].[Product]
WHERE ProductID IN 
(
	941
	,945
	,948
	,952
)

