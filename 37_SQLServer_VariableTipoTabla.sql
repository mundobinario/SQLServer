--SELECT 
--	[p].[BusinessEntityID]
--	,ISNULL([p].[FirstName], '') + ' ' + 
--	ISNULL([p].[MiddleName], '') + ' ' + 
--	ISNULL([p].[LastName], '')
--	,[pp].[PhoneNumber]
--	,GETDATE()
--FROM 
--	[Person].[Person] AS [p]
--	INNER JOIN [Person].[PersonPhone]AS [pp]
--		ON [p].[BusinessEntityID] = [pp].[BusinessEntityID]
--WHERE	
--	[pp].[PhoneNumberTypeID] = 1
--	AND ([pp].[PhoneNumber] LIKE '200%' 
--	OR [pp].[PhoneNumber] LIKE '300%')

DECLARE @PersonPromotion AS TABLE
(
	[BusinessEntityID]	INT	PRIMARY KEY		NOT NULL
	,[PersonFullName]	NVARCHAR(100)		NOT NULL
	,[PersonPhone]		NVARCHAR(25)		NOT NULL
	,[ModifiedDate]		DATETIME			NOT NULL
);

INSERT INTO @PersonPromotion
SELECT 
	[p].[BusinessEntityID]
	,ISNULL([p].[FirstName], '') + ' ' + 
	ISNULL([p].[MiddleName], '') + ' ' + 
	ISNULL([p].[LastName], '')
	,[pp].[PhoneNumber]
	,GETDATE()
FROM 
	[Person].[Person] AS [p]
	INNER JOIN [Person].[PersonPhone]AS [pp]
		ON [p].[BusinessEntityID] = [pp].[BusinessEntityID]
WHERE	
	[pp].[PhoneNumberTypeID] = 1
	AND ([pp].[PhoneNumber] LIKE '200%' 
	OR [pp].[PhoneNumber] LIKE '300%')


SELECT 
	[pp].[BusinessEntityID]
	,[pp].[PersonFullName]
	,[pp].[PersonPhone]
	,[pp].[ModifiedDate]
	,[p].[PersonType]
FROM 
	@PersonPromotion AS [pp]
	INNER JOIN [Person].[Person] AS [p]
		ON [pp].[BusinessEntityID] = [p].[BusinessEntityID]
