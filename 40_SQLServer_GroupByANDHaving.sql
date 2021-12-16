--Funciones de Windows agregadas
--SUM(), MAX(), MIN(), AVG(). COUNT() 

SELECT 
	[sod].[ProductID]
	,[p].[Name]
	,COUNT([sod].[ProductID]) AS ProdCount
	,SUM([sod].[UnitPrice]) AS [Total]
	,[p].[Class]
FROM 
	[Sales].[SalesOrderDetail] AS [sod]
	INNER JOIN [Production].[Product] AS [p]
		ON [p].[ProductID] = [sod].[ProductID]
WHERE 
	[p].[Class] IS NOT NULL
	--AND COUNT([sod].[ProductID]) >=200
GROUP BY
	[sod].[ProductID]
	,[p].[Name]
	,[p].[Class]
	,[p].[Color]
HAVING
	COUNT([sod].[ProductID]) >= 500


SELECT [d].[department_name], SUM([e].[employee_salary]), COUNT(e.employee_id) FROM [dbo].[Employees] AS [e]
INNER JOIN [dbo].[Departments] AS [d]
	ON [d].[department_id] = [e].[department_id]
GROUP BY 
	[d].[department_name]
HAVING
	SUM([e].[employee_salary])  >= 2000
	AND  COUNT(e.employee_id) <=5
ORDER BY 
	SUM([e].[employee_salary]) DESC



