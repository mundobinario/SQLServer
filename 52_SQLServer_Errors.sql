
-- Seleccionar errores que podemos obtener al implementar TRY... CATCH.
--BEGIN TRY

--	INSERT INTO [Purchasing].[ShipMethod]
--	  ([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
--	  VALUES
--	  ('OVERSEAS EXPRESS', NULL, 3.20, NEWID(),GETDATE())

--	  Print 'Se insert� correctamente el nuevo m�todo de env�o'

--END TRY
--BEGIN CATCH
--	Print 'Error al insertar el nuevo m�todo de env�o'
--	SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_LINE(), ERROR_PROCEDURE() 
--END CATCH


-- Eliminar registros de [ShipMethod]
DELETE FROM [Purchasing].[ShipMethod]
WHERE ShipMethodID=8

-- Resturar numeraci�n en la tabla
DBCC CHECKIDENT ([Purchasing.ShipMethod], RESEED, 5)

BEGIN TRY

	INSERT INTO [Purchasing].[ShipMethod]
	  ([Name], [ShipBase], [ShipRate], [rowguid], [ModifiedDate])
	  VALUES
	  ('OVERSEAS EXPRESS', 3, 3.20, NEWID(),GETDATE())

	 SELECT @@TRANCOUNT

END TRY
BEGIN CATCH
	Print 'Error al insertar el nuevo m�todo de env�o'
	SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_LINE(), ERROR_PROCEDURE() 
END CATCH

