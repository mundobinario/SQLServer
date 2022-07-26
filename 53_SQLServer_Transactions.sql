
-- Insertar en [ShipMethod]
INSERT INTO [Purchasing].[ShipMethod]
([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
VALUES
('OVERSEAS EXPRESS', 20, 3.20, NEWID(),GETDATE())

-- Insertar en [ShipMethod] con transacciones

BEGIN TRAN

INSERT INTO [Purchasing].[ShipMethod]
  ([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
  VALUES
  ('OVERSEAS EXPRESS', 20, 3.20, NEWID(),GETDATE())

-- Verificar si se realiz� la inserci�n
SELECT 
	[ShipMethodID], [Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate]
FROM 
	[Purchasing].[ShipMethod]

-- N�mero de transacciones abiertas
SELECT @@TRANCOUNT AS TransaccionesAbiertas

-- Anular la transacci�n
ROLLBACK TRAN

-- Aplicar la transacci�n
COMMIT TRAN








-- Implementaci�n de un TRY... CATCH
BEGIN TRY
	INSERT INTO [Purchasing].[ShipMethod]
	  ([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
	  VALUES
	  ('OVERSEAS EXPRESS', NULL, 3.20, NEWID(),GETDATE())

	  Print 'Se insert� correctamente el nuevo m�todo de env�o'

END TRY
BEGIN CATCH
	Print 'Error al insertar el nuevo m�todo de env�o'
	
END CATCH


-- Implementar transacciones en Stored Procedure con TRY... CATCH.
ALTER PROCEDURE uspInsertShipMethod
	@name			AS VARCHAR(50)
	,@shipBase		AS MONEY
	,@shipRate		AS MONEY
	,@rowGuid		AS UNIQUEIDENTIFIER
	,@modifiedDate	AS DATETIME
AS
BEGIN
	BEGIN TRY

		BEGIN TRAN

		UPDATE [Purchasing].[ShipMethod]
		SET [ModifiedDate] = GETDATE()	

		INSERT INTO [Purchasing].[ShipMethod]
			([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
		VALUES
			(@name, @shipBase, @shipRate, @rowGuid, @modifiedDate)

		PRINT 'Se insert� correctamente el nuevo m�todo de env�o'

		COMMIT TRAN

	END TRY
	BEGIN CATCH

		ROLLBACK TRAN
		PRINT 'Error al insertar el nuevo m�todo de env�o'	

	END CATCH
END
GO

-- Ejecutar stored procedure
DECLARE @id			AS UNIQUEIDENTIFIER 
		,@date		AS DATETIME

SELECT @id = NEWID(), @date = GETDATE()

EXEC [dbo].[uspInsertShipMethod] 'OVERSEAS EXPRESS', 5, 3.20, @id, @date


