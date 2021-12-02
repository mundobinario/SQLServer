-- Tabla local temporal, tabla global temporal
-- #Local
-- #Global

SELECT 
	* 
FROM 
	[Production].[Location]

  IF OBJECT_ID('tempdb..#Location_temp') IS NOT NULL
	BEGIN
		DROP TABLE #Location_temp
	END

CREATE TABLE #Location_temp 
		(
			[LocationID]			SMALLINT		NOT NULL
			,[Name]					NVARCHAR(50)	NOT NULL
			,[CostRate]				SMALLMONEY		NOT NULL
			,[Availability]			DECIMAL(8,2)	NOT NULL
			,[ModifiedDate]			DATETIME		NOT NULL
		);

SELECT 
	* 
FROM 
	[Production].[Location]
WHERE
	[CostRate] = 0

INSERT INTO #Location_temp
SELECT 
	[LocationID], [Name], [CostRate], [Availability], [ModifiedDate]		
FROM 
	[Production].[Location]
WHERE
	[CostRate] = 0

SELECT * FROM #Location_temp
