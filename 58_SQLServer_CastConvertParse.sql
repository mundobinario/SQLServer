SELECT TRY_CAST('abc' AS INT);
SELECT TRY_CONVERT(INT, 'abc') AS ConvertedValue

SELECT TRY_CAST('10' AS INT) AS CastValue;
SELECT TRY_CONVERT(INT, '10') AS ConvertedValue


SELECT CAST('1020' AS INT);
SELECT CAST(10.999 AS NUMERIC(12, 3)) AS numeric_to_numeric,
		CAST(10.999 AS INT) AS numeric_to_int;


DECLARE @s AS CHAR(21) = '20170212 23:59:59.999',
		@dt2 AS DATETIME2 = '20170212 23:59:59.999999';
		
SELECT
	CAST(@s AS DATETIME) AS char_to_datetime,
	CAST(@dt2 AS DATETIME) AS char_to_datetime;
	   

SELECT [CustomerID]
		,[PersonID]
		,[StoreID]
		,[TerritoryID]
		,[AccountNumber]
		,[ModifiedDate]
FROM 
	[Sales].[Customer]
--WHERE 
	--CAST([ModifiedDate] AS DATE) = CAST(GETDATE() AS DATE)
	--CONVERT(DATE, [ModifiedDate]) = CONVERT(DATE, GETDATE())
	   	   	 
DECLARE @date DATETIME
SET @date = GETDATE()
SELECT CONVERT(VARCHAR, @date, 4) AS [ConvertedValue]

SELECT CONVERT(VARCHAR(2), MONTH(GETDATE()))


SELECT TRY_PARSE('Nov 11, 2022' AS DATETIME) AS [CurrentDate]
SELECT PARSE('$150.50' AS MONEY USING 'es-MX') AS Result;  

--Recursos
--https://www.sqlshack.com/sql-convert-date-functions-and-formats/
--https://learn.microsoft.com/es-es/sql/t-sql/functions/parse-transact-sql?view=sql-server-ver16
