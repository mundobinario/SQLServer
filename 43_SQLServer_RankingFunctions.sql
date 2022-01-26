--SELECT [SalesOrderID]
--      ,[CustomerID]
--	  ,[TaxAmt]
--	  ,ROW_NUMBER() OVER(ORDER BY [TaxAmt] ASC)	AS [RowNumber]
--	  ,RANK()		OVER(ORDER BY [TaxAmt] ASC)	AS [rnk]
--	  ,DENSE_RANK() OVER(ORDER BY [TaxAmt] ASC)	AS [densernk]
--	  ,NTILE(2)		OVER(ORDER BY [TaxAmt] ASC)	AS [ntile]
--  FROM 
--	[Sales].[SalesOrderHeader]
--  WHERE 
--	CustomerID = 29869



--  SELECT
--		[BusinessEntityID]
--		,[LoginID]
--		,[Gender]
--		,[VacationHours]
--		,NTILE(2)	OVER(ORDER BY [VacationHours] )	AS [ntile]
--  FROM 
--	[HumanResources].[Employee]







	WITH CTEVacations
	AS
	(
		SELECT 
			BusinessEntityID
			,LoginID
			,JobTitle
			,OrganizationLevel
			,VacationHours
			,DENSE_RANK() OVER(ORDER BY OrganizationLevel ASC) AS [Group]
			,DENSE_RANK() OVER(PARTITION BY OrganizationLevel ORDER BY VacationHours DESC) AS [Position]
		FROM 
			[HumanResources].[Employee]
		WHERE
			[Gender] = 'M' AND VacationHours > 0
	)

	SELECT * FROM CTEVacations
	WHERE [Position] = 4






