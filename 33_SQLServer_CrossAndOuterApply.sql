--SELECT 
--	COUNT(*)
--FROM 
--	[Sales].[SalesOrderHeader] AS [soh]
--	INNER JOIN [Sales].[CurrencyRate] AS [cr]
--		ON [soh].[CurrencyRateID] = [cr].[CurrencyRateID]
--	INNER JOIN [Sales].[Currency] AS [c]
--		ON [cr].[FromCurrencyCode] = [c].[CurrencyCode]
--WHERE 
--	[cr].[ToCurrencyCode]='EUR'



--SELECT 
--	*
--FROM 
--	[Sales].[SalesOrderHeader] AS [soh]
--	CROSS APPLY 
--		(
--			SELECT 
--				cr.*
--			FROM 
--				[Sales].[CurrencyRate] AS [cr]
--				INNER JOIN [Sales].[Currency] AS [c]
--					ON [cr].[FromCurrencyCode] = [c].[CurrencyCode]
--			WHERE 
--				[soh].[CurrencyRateID] = [cr].[CurrencyRateID]
--		) AS [c1]
--WHERE 
--	[c1].[ToCurrencyCode]='EUR'


--
--WITH CTE_Currency
--AS (
--	SELECT 
--		DISTINCT
--		TOP 3 
--		[CurrencyRateID] 
--		,[FromCurrencyCode]
--		,[ToCurrencyCode]
--		,[ModifiedDate]
--	FROM [Sales].[CurrencyRate]
--	ORDER BY [ModifiedDate] DESC
--)

--SELECT 
--	[soh].*
--FROM 
--	[Sales].[SalesOrderHeader] AS [soh]
--	INNER JOIN CTE_Currency AS [cte]
--		ON [soh].[CurrencyRateID] = [cte].[CurrencyRateID]

SELECT 
	[soh].*
FROM 
	[Sales].[SalesOrderHeader] AS [soh]
	CROSS APPLY
		(
			SELECT 
				DISTINCT
				TOP 3 
				[CurrencyRateID] 
				,[FromCurrencyCode]
				,[ToCurrencyCode]
				,[ModifiedDate]
			FROM 
				[Sales].[CurrencyRate] AS [cr]
			ORDER BY 
				[ModifiedDate] DESC
		) AS [ca]
WHERE 
	[soh].[CurrencyRateID] = [ca].[CurrencyRateID] 







SELECT 
	* 
FROM 
	[Production].[Product] AS [p]
	LEFT JOIN [Production].[ProductCategory] AS [pc]
		ON [p].[ProductSubcategoryID] = [pc].[ProductCategoryID]

SELECT 
	* 
FROM 
	[Production].[Product] AS [p]
	OUTER APPLY
		(
			SELECT * 
			FROM [Production].[ProductCategory] AS [pc]
			WHERE [p].[ProductSubcategoryID] = [pc].[ProductCategoryID]
		) AS [o1]
