<<<<<<< HEAD
-- SUBCONSULTAS

-- COLUMN
SELECT 
	[soh].[SalesOrderID]
	,[soh].[OrderDate]
    ,(
		SELECT MAX([sod].[UnitPrice])
		FROM [Sales].[SalesOrderDetail] AS [sod]
		WHERE [soh].[SalesOrderID] = [sod].[SalesOrderID]
	) AS MaxUnitPrice
FROM 
	[Sales].[SalesOrderHeader] AS [soh];

SELECT  
	[soh].[SalesOrderID]
	,[soh].[OrderDate]
    ,MAX([sod].[UnitPrice])

FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
GROUP BY
	[soh].[SalesOrderID]
	,[soh].[OrderDate];

-- JOIN
SELECT
	[e1].[BusinessEntityID]
	,[e1].[LoginID]
	,[e1].[JobTitle]
	,[e1].[VacationHours]
	,[Sub].[AverageVacation] 
FROM 
	[HumanResources].[Employee] AS [e1]
	INNER JOIN 
		(
		SELECT
			[e2].[JobTitle]
			,AVG([e2].[VacationHours]) AS [AverageVacation]
		FROM 
			[HumanResources].[Employee] AS [e2]
		GROUP BY 
			[e2].[JobTitle]
		) AS [sub]
	ON [e1].[JobTitle] = [sub].[JobTitle]
WHERE 
	[e1].[VacationHours] > [sub].[AverageVacation]
ORDER BY 
	[e1].[JobTitle]


;WITH CTE_VacationAVG AS
(
	SELECT
		[e2].[JobTitle]
		,AVG([e2].[VacationHours]) AS [AverageVacation]
	FROM 
		[HumanResources].[Employee] AS [e2]
	GROUP BY 
		[e2].[JobTitle]
)

SELECT
	[e1].[BusinessEntityID]
	,[e1].[LoginID]
	,[e1].[JobTitle]
	,[e1].[VacationHours]
	,[cte].[AverageVacation] 
FROM 
	[HumanResources].[Employee] AS [e1]
	INNER JOIN [CTE_VacationAVG] AS [cte]
		ON [e1].[JobTitle] = [cte].[JobTitle]
WHERE 
	[e1].[VacationHours] > [cte].[AverageVacation]
ORDER BY 
	[e1].[JobTitle]

SELECT
	[e1].[BusinessEntityID]
	,[e1].[LoginID]
	,[e1].[JobTitle]
	,[e1].[VacationHours]
	,[Sub].[AverageVacation] 
FROM 
	[HumanResources].[Employee] AS [e1]
	INNER JOIN 
		(SELECT
			[e2].[JobTitle]
			,AVG([e2].[VacationHours]) AS [AverageVacation]
		FROM 
			[HumanResources].[Employee] AS [e2]
		GROUP BY 
			[e2].[JobTitle]
		) AS [sub]
	ON [e1].[JobTitle] = [sub].[JobTitle]
WHERE 
	[e1].[VacationHours] > [sub].[AverageVacation]
ORDER BY 
	[e1].[JobTitle]

-- WHERE
SELECT 
	[soh].[SalesOrderNumber]
	,[soh].[OrderDate]
	,[soh].[CustomerID]
	,[soh].[TotalDue]
	,[sod].[ProductID]
	,[sod].[OrderQty]
	,[sod].[UnitPrice]
FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
WHERE
	[sod].[ProductID] 
	IN 
		(
			SELECT 
				[ProductID]
			FROM
				[Production].[Product] AS [p]
			WHERE 
				[p].[MakeFlag] = 1
		);

SELECT 
	[oh].[SalesOrderNumber]
	,[oh].[OrderDate]
	,[oh].[CustomerID]
	,[oh].[TotalDue]
	,[od].[ProductID]
	,[od].[OrderQty]
	,[od].[UnitPrice]
FROM 
	[Sales].[SalesOrderHeader] AS [oh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [od]
		ON [oh].[SalesOrderID] = [od].[SalesOrderID]
	INNER JOIN [Production].[Product] AS [p]
		ON [od].[ProductID] = [p].[ProductID]
		AND [p].[MakeFlag] = 1;


=======
-- SUBCONSULTAS

-- COLUMN
SELECT 
	[soh].[SalesOrderID]
	,[soh].[OrderDate]
    ,(
		SELECT MAX([sod].[UnitPrice])
		FROM [Sales].[SalesOrderDetail] AS [sod]
		WHERE [soh].[SalesOrderID] = [sod].[SalesOrderID]
	) AS MaxUnitPrice
FROM 
	[Sales].[SalesOrderHeader] AS [soh];

SELECT  
	[soh].[SalesOrderID]
	,[soh].[OrderDate]
    ,MAX([sod].[UnitPrice])

FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
GROUP BY
	[soh].[SalesOrderID]
	,[soh].[OrderDate];

-- JOIN
SELECT
	[e1].[BusinessEntityID]
	,[e1].[LoginID]
	,[e1].[JobTitle]
	,[e1].[VacationHours]
	,[Sub].[AverageVacation] 
FROM 
	[HumanResources].[Employee] AS [e1]
	INNER JOIN 
		(
		SELECT
			[e2].[JobTitle]
			,AVG([e2].[VacationHours]) AS [AverageVacation]
		FROM 
			[HumanResources].[Employee] AS [e2]
		GROUP BY 
			[e2].[JobTitle]
		) AS [sub]
	ON [e1].[JobTitle] = [sub].[JobTitle]
WHERE 
	[e1].[VacationHours] > [sub].[AverageVacation]
ORDER BY 
	[e1].[JobTitle]


;WITH CTE_VacationAVG AS
(
	SELECT
		[e2].[JobTitle]
		,AVG([e2].[VacationHours]) AS [AverageVacation]
	FROM 
		[HumanResources].[Employee] AS [e2]
	GROUP BY 
		[e2].[JobTitle]
)

SELECT
	[e1].[BusinessEntityID]
	,[e1].[LoginID]
	,[e1].[JobTitle]
	,[e1].[VacationHours]
	,[cte].[AverageVacation] 
FROM 
	[HumanResources].[Employee] AS [e1]
	INNER JOIN [CTE_VacationAVG] AS [cte]
		ON [e1].[JobTitle] = [cte].[JobTitle]
WHERE 
	[e1].[VacationHours] > [cte].[AverageVacation]
ORDER BY 
	[e1].[JobTitle]

SELECT
	[e1].[BusinessEntityID]
	,[e1].[LoginID]
	,[e1].[JobTitle]
	,[e1].[VacationHours]
	,[Sub].[AverageVacation] 
FROM 
	[HumanResources].[Employee] AS [e1]
	INNER JOIN 
		(SELECT
			[e2].[JobTitle]
			,AVG([e2].[VacationHours]) AS [AverageVacation]
		FROM 
			[HumanResources].[Employee] AS [e2]
		GROUP BY 
			[e2].[JobTitle]
		) AS [sub]
	ON [e1].[JobTitle] = [sub].[JobTitle]
WHERE 
	[e1].[VacationHours] > [sub].[AverageVacation]
ORDER BY 
	[e1].[JobTitle]

-- WHERE
SELECT 
	[soh].[SalesOrderNumber]
	,[soh].[OrderDate]
	,[soh].[CustomerID]
	,[soh].[TotalDue]
	,[sod].[ProductID]
	,[sod].[OrderQty]
	,[sod].[UnitPrice]
FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
WHERE
	[sod].[ProductID] 
	IN 
		(
			SELECT 
				[ProductID]
			FROM
				[Production].[Product] AS [p]
			WHERE 
				[p].[MakeFlag] = 1
		);

SELECT 
	[oh].[SalesOrderNumber]
	,[oh].[OrderDate]
	,[oh].[CustomerID]
	,[oh].[TotalDue]
	,[od].[ProductID]
	,[od].[OrderQty]
	,[od].[UnitPrice]
FROM 
	[Sales].[SalesOrderHeader] AS [oh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [od]
		ON [oh].[SalesOrderID] = [od].[SalesOrderID]
	INNER JOIN [Production].[Product] AS [p]
		ON [od].[ProductID] = [p].[ProductID]
		AND [p].[MakeFlag] = 1;


>>>>>>> cdc4bbd9d34ca1960b2614d2d24f7fb755dad9c0
