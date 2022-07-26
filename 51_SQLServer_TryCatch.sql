--GUID
SELECT NEWID() AS [rowguid]

-- Insertar en [ShipMethod]
INSERT INTO [Purchasing].[ShipMethod]
  ([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
  VALUES
  ('OVERSEAS EXPRESS', NULL, 3.20, NEWID(),GETDATE())

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


-- Creación de Stored Procedure

-- =============================================
-- Author:		<Axel Romero>
-- Create date: <22.07.2022>
-- Description:	<Insertar información en [Purchasing].[ShipMethod]>
-- =============================================
CREATE PROCEDURE uspInsertShipMethod
	@name			AS VARCHAR(50)
	,@shipBase		AS MONEY
	,@shipRate		AS MONEY
	,@rowGuid		AS UNIQUEIDENTIFIER
	,@modifiedDate	AS DATETIME
AS
BEGIN
	BEGIN TRY
	INSERT INTO [Purchasing].[ShipMethod]
	([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
	VALUES
	(@name, @shipBase, @shipRate, @rowGuid, @modifiedDate)

	  Print 'Se insertó correctamente el nuevo método de envío'

	END TRY
	BEGIN CATCH
		Print 'Error al insertar el nuevo método de envío'	
	END CATCH
END
GO

-- Ejecutar SP para comprobar funcionalidad de TRY... CATCH.

DECLARE @id			AS UNIQUEIDENTIFIER 
		,@date		AS DATETIME

SELECT @id = NEWID(), @date = GETDATE()

EXEC [dbo].[uspInsertShipMethod] 'OVERSEAS EXPRESS', NULL, 3.20, @id, @date

-- Implementar update en el stored procedures para demostrar que se ejecuta proceso hasta encontrar el error.
UPDATE [Purchasing].[ShipMethod]
SET [ModifiedDate] = GETDATE()
SELECT * FROM [Purchasing].[ShipMethod]