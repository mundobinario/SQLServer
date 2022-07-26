
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

-- Verificar si se realizó la inserción
SELECT 
	[ShipMethodID], [Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate]
FROM 
	[Purchasing].[ShipMethod]

-- Número de transacciones abiertas
SELECT @@TRANCOUNT AS TransaccionesAbiertas

-- Anular la transacción
ROLLBACK TRAN

-- Aplicar la transacción
COMMIT TRAN








-- Implementación de un TRY... CATCH
BEGIN TRY
	INSERT INTO [Purchasing].[ShipMethod]
	  ([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
	  VALUES
	  ('OVERSEAS EXPRESS', NULL, 3.20, NEWID(),GETDATE())

	  Print 'Se insertó correctamente el nuevo método de envío'

END TRY
BEGIN CATCH
	Print 'Error al insertar el nuevo método de envío'
	
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

		PRINT 'Se insertó correctamente el nuevo método de envío'

		COMMIT TRAN

	END TRY
	BEGIN CATCH

		ROLLBACK TRAN
		PRINT 'Error al insertar el nuevo método de envío'	

	END CATCH
END
GO

-- Ejecutar stored procedure
DECLARE @id			AS UNIQUEIDENTIFIER 
		,@date		AS DATETIME

SELECT @id = NEWID(), @date = GETDATE()

EXEC [dbo].[uspInsertShipMethod] 'OVERSEAS EXPRESS', 5, 3.20, @id, @date


