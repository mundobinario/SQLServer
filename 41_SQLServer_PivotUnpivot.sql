--SELECT YEAR(OrderDate) as YearRef, SUM(TotalDue) as TOTAL FROM [Sales].[SalesOrderHeader]
--GROUP BY YEAR(OrderDate)



---- PIVOT
SELECT * FROM 
(
SELECT YEAR([soh].[OrderDate])	AS [SalesYear]
		,[soh].[TotalDue]		AS [TotalSales]
 FROM [Sales].[SalesOrderHeader] AS [soh]
) AS [Sales]
PIVOT (SUM([TotalSales])
FOR [SalesYear] IN ([2011],[2012],[2013],[2014]))
AS [pvt]


---- UNPIVOT
SELECT SalesYear, 
       TotalSales
FROM
(
    SELECT 
		*
    FROM
    (
        SELECT YEAR([soh].[OrderDate]) AS [SalesYear]
				,[soh].[SubTotal] AS [TotalSales]
        FROM [sales].[SalesOrderHeader] AS [soh]
    ) AS [Sales] PIVOT(SUM([TotalSales]) FOR [SalesYear] IN([2011], 
                                                      [2012], 
                                                      [2013], 
                                                      [2014])) AS [PVT]
) AS [T] UNPIVOT(TotalSales FOR [SalesYear] IN([2011], 
                                        [2012], 
                                        [2013], 
                                        [2014])) AS [upvt];


SELECT * FROM 
(
SELECT 
		DAY([soh].[OrderDate])	AS [SalesDaily]
		,[soh].[TotalDue]		AS [TotalSales]
 FROM [sales].[SalesOrderHeader] AS [soh]
 WHERE [soh].[OrderDate] >= '2011-06-01' AND [soh].[OrderDate]<='2011-06-30'
) AS [Sales]
PIVOT (SUM([TotalSales])
FOR [SalesDaily] IN ([01],[02]))
as [pvt]



DECLARE @columns AS VARCHAR(MAX)
DECLARE @startDate AS VARCHAR(10) = '2011-06-01'
DECLARE @endDate AS VARCHAR(10) = '2011-06-30' 


SELECT @columns = STUFF(
 (
 SELECT
   ',' + QUOTENAME(LTRIM(DAY([OrderDate])))
 FROM
   (
   SELECT DISTINCT [OrderDate]
    FROM [Sales].[SalesOrderHeader] AS [soh]
	WHERE [soh].[OrderDate] >= @startDate AND [soh].[OrderDate] <= @endDate
   ) AS [T]
 ORDER BY
	[OrderDate]
 FOR XML PATH('')
 ), 1, 1, ''); 

 SELECT @columns


 DECLARE @sql nvarchar(MAX)

SET @sql = N'
	SELECT * FROM 
	(
	SELECT 
			DAY([soh].[OrderDate]) AS [SalesDaily]
			,[soh].[TotalDue] AS [TotalSales]
	 FROM [sales].[SalesOrderHeader] AS [soh]
	WHERE [soh].[OrderDate] >= '+ CHAR(39) + @startDate + CHAR(39) +' AND [soh].[OrderDate]<= '  + CHAR(39) + @endDate + CHAR(39) + '
	) AS [Sales]
		PIVOT (SUM([TotalSales])
		FOR [SalesDaily] IN (' + @columns + N')
	)
	AS [pvt]
';



 EXEC sp_executesql @sql;














