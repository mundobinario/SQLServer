
--Referencias:
--https://learn.microsoft.com/es-es/sql/t-sql/functions/string-split-transact-sql?view=sql-server-ver16

--Función
SELECT RTRIM(value) FROM STRING_SPLIT('hola@mundobinario.com.mx, mundobinariobyaxel@gmail.com, contactomundobinario@gmail.com', ',')

--Script
	DECLARE @listOfValues	VARCHAR(MAX)	= 'Axel, Romero, Rendon'
	DECLARE @delimiter		VARCHAR(5)		= ','

	DECLARE @list AS TABLE
	(
		 [ID]		INT
		,[Value]	NVARCHAR(MAX)
	)

	DECLARE @value NVARCHAR(MAX)
			,@id	INT		= 0	
	
	WHILE CHARINDEX(@delimiter, @listOfValues, 0) <> 0 
	BEGIN 
		SELECT  
			@value = RTRIM(LTRIM(SUBSTRING(@listOfValues,1,CHARINDEX(@delimiter, @listOfValues,0)-1))),  
			@listOfValues = RTRIM(LTRIM(SUBSTRING(@listOfValues, CHARINDEX(@delimiter, @listOfValues,0)+LEN(@delimiter),LEN(@listOfValues))))  
	
		IF LEN(@value) > 0
		BEGIN
			INSERT INTO @List 
				SELECT @id, @value 
		END 
		ELSE 
		BEGIN
			INSERT INTO @List 
				SELECT @id, NULL
		END

		SET @id	+= 1
	END
	
	IF LEN(@listOfValues) > 0 Begin
		INSERT INTO @List 
			SELECT @id, @listOfValues --Insert value of temporal table
	End

	SELECT [ID], [Value] FROM @list

-- Función
-- =============================================
-- Author:		<Axel Romero>
-- Create date: <11.01.2024>
-- Description:	<Regresa valores previamente separados por un delimitador.>
-- =============================================
CREATE FUNCTION fn_SplitString
(	
	-- Add the parameters for the function here
	@listOfValues	VARCHAR(MAX)	
	,@delimiter		VARCHAR(5)	
)
RETURNS @list TABLE 
(
	 [ID]		INT
	,[Value]	NVARCHAR(MAX)
)
BEGIN

	DECLARE @value NVARCHAR(MAX)
			,@id	INT		= 0	
	
	WHILE CHARINDEX(@delimiter, @listOfValues, 0) <> 0 
	BEGIN 
		SELECT  
			@value = RTRIM(LTRIM(SUBSTRING(@listOfValues,1,CHARINDEX(@delimiter, @listOfValues,0)-1))),  
			@listOfValues = RTRIM(LTRIM(SUBSTRING(@listOfValues, CHARINDEX(@delimiter, @listOfValues,0)+LEN(@delimiter),LEN(@listOfValues))))  
	
		IF LEN(@value) > 0
		BEGIN
			INSERT INTO @List 
				SELECT @id, @value 
		END 
		ELSE 
		BEGIN
			INSERT INTO @List 
				SELECT @id, NULL
		END

		SET @id	+= 1
	END

	RETURN
END


--Test
SELECT RTRIM(value) 
FROM Customers
	OUTER APPLY STRING_SPLIT(REPLACE([Email], ' ', ''), ',')
WHERE
	CustomerID='ALFKI'

SELECT [Value]
FROM Customers
	OUTER APPLY fn_SplitString([Email], ',')
WHERE
	CustomerID='ALFKI'