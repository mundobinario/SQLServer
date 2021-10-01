
--MERGE INTO <target table> AS TGT 
--USING <SOURCE TABLE> AS SRC   
--	ON <merge predicate> 
--WHEN MATCHED [AND <predicate>] -- two clauses allowed:   
--	THEN <action> -- one with UPDATE one with DELETE 
--WHEN NOT MATCHED [BY TARGET] [AND <predicate>] -- one clause allowed:   
--	THEN INSERT... –- if indicated, action must be INSERT 
--WHEN NOT MATCHED BY SOURCE [AND <predicate>] -- two clauses allowed:   
--	THEN <action>; -- one with UPDATE one with DELETE




--CREATE TABLE Purchasing.Vendor_Temp
--(
--	[BusinessEntityID]		INT				NOT NULL
--	,[AccountNumber]		NVARCHAR(15)	NOT NULL
--	,[Name]					NVARCHAR(50)	NOT NULL
--	,[CreditRating]			TINYINT			NOT NULL
--	,[PreferredVendorStatus]BIT				NOT NULL
--	,[ActiveFlag]			BIT				NOT NULL
--)

--SELECT MAX([BusinessEntityID]) FROM [Purchasing].[Vendor]

--SELECT * FROM [Purchasing].[Vendor]

--INSERT INTO Purchasing.Vendor_Temp
--	([BusinessEntityID],[AccountNumber], [Name], [CreditRating], [PreferredVendorStatus], [ActiveFlag])
--VALUES
--	(1699, 'ADVANCED0001', 'Advanced Bicycles', 5, 1, 0)
--	,(1700,'MORGANB0001', 'Morgan Bike Accessories', 5, 1, 0)
--	,(1701,'MBMEX001', 'Mundo Binario México', 1, 1, 1)
--	,(1702,'MBCOL001', 'Mundo Binario Colombia', 1, 1, 1)
--	,(1703,'MBARG001', 'Mundo Binario Argentina', 1, 1, 1)
--	,(1704,'MBPER001', 'Mundo Binario Perú', 1, 1, 1)


--SELECT * FROM Purchasing.Vendor_Temp
--SELECT * FROM Purchasing.Vendor





MERGE [Purchasing].[Vendor] AS [tgt]
USING
(
	SELECT
		[vt].[BusinessEntityID]
		,[vt].[AccountNumber]
		,[vt].[Name]
		,[vt].[CreditRating]
		,[vt].[PreferredVendorStatus]
		,[vt].[ActiveFlag]
	FROM 
		Purchasing.Vendor_Temp AS [vt]
) AS [src]
ON
(
	[src].[AccountNumber] = [tgt].[AccountNumber]
)
WHEN MATCHED THEN
	UPDATE 
		SET
			[tgt].[Name] = [src].[Name]
			,[tgt].[CreditRating] = [src].[CreditRating]
			,[tgt].[PreferredVendorStatus] = [src].[PreferredVendorStatus]
			,[tgt].[ActiveFlag] = [src].[ActiveFlag]
			,[tgt].[ModifiedDate] = GETDATE()
WHEN NOT MATCHED THEN
	INSERT
	(
		[BusinessEntityID]
		,[AccountNumber]
		,[Name]
		,[CreditRating]
		,[PreferredVendorStatus]
		,[ActiveFlag]
		,[PurchasingWebServiceURL]
		,[ModifiedDate]
	)
	VALUES
	(
		[src].[BusinessEntityID]
		,[src].[AccountNumber]
		,[src].[Name]
		,[src].[CreditRating]
		,[src].[PreferredVendorStatus]
		,[src].[ActiveFlag]
		,NULL
		,GETDATE()
	);

SELECT * FROM [Purchasing].[Vendor] 

