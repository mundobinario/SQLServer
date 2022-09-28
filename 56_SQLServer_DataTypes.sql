DECLARE @varchar			AS VARCHAR(100) = '二進制'
DECLARE @nvarchar			AS NVARCHAR(100) = N'二進制'

SELECT @varchar				AS [varchar] 
		,@nvarchar			AS [nvarchar]
SELECT 
	DATALENGTH(@varchar)	AS [longVARCHAR] 
	,DATALENGTH(@nvarchar)	AS [longNVARCHAR]


DECLARE @numero AS INT = 5.85
SELECT @numero 


DECLARE @fecha AS DATETIME = GETDATE()
SELECT @fecha 

DECLARE @decimal AS DECIMAL(18,6) = 20.5555455
SELECT @decimal 