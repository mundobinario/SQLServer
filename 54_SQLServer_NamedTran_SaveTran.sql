SELECT 
	[p].[ProductID]
	,[p].[Name]
	,[p].[ProductNumber]
	,[p].[ModifiedDate]
FROM 
	[Production].[Product] AS [p]
WHERE [p].[ProductID] IN (1,2,3,4)


-- BEGIN TRAN: Inicio transacción
-- COMMIT TRAN: Aplica cambios
-- ROLLBACK TRAN: Revierto cambios





-- Named transactions

BEGIN TRAN ActualizarProductos

UPDATE [Production].[Product]
SET ModifiedDate = GETDATE()
WHERE [ProductID] = 1

UPDATE [Production].[Product]
SET ModifiedDate = GETDATE()
WHERE [ProductID] = 2

UPDATE [Production].[Product]
SET ModifiedDate = GETDATE()
WHERE [ProductID] = 3

ROLLBACK TRAN ActualizarProductos


BEGIN TRAN ActualizarID4

UPDATE [Production].[Product]
SET [ProductNumber] = 'BE-2908', ModifiedDate = GETDATE()
WHERE [ProductID] = 4

COMMIT TRAN ActualizarID4





SELECT 
	[p].[ProductID]
	,[p].[Name]
	,[p].[ProductNumber]
	,[p].[ModifiedDate]
FROM 
	[Production].[Product] AS [p]
WHERE [p].[ProductID] IN (1,2,3)

-- Save transactions

BEGIN TRAN

UPDATE [Production].[Product]
SET [Name] = 'Adjustable Race PRO', ModifiedDate = GETDATE()
WHERE [ProductID] = 1
SAVE TRAN Producto1

UPDATE [Production].[Product]
SET [Name] = 'Bearing Ball Premium', ModifiedDate = GETDATE()
WHERE [ProductID] = 2
SAVE TRAN Producto2

UPDATE [Production].[Product]
SET [Name] = 'BB Ball Bearing Mini', ModifiedDate = GETDATE()
WHERE [ProductID] = 3
SAVE TRAN Producto3

ROLLBACK TRAN Producto2

COMMIT TRAN

