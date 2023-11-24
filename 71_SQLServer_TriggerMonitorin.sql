--Crear tabla de monitoreo
CREATE TABLE Monitoring
(
   [MonitorID]		INT IDENTITY(1,1) PRIMARY KEY
   ,[TableName]		VARCHAR(100)	NOT NULL
   ,[Transaction]	VARCHAR(50)		NOT NULL
   ,[Reference]		VARCHAR(250)	NOT NULL
   ,[CreatedAt]		DATETIME DEFAULT GETDATE()
)

--Crear trigger
CREATE TRIGGER CustomersMonitoring
ON [dbo].[Customers]
AFTER INSERT, DELETE
AS
BEGIN

		INSERT INTO Monitoring
		([TableName], [Transaction], [Reference])
		VALUES
		('Customers', 'INSERT', 'Se ha insertado el cliente')
END

--Insertar Cliente
INSERT INTO [dbo].[Customers]
([CustomerID],[CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [LastOrderDate])
VALUES
'MB', 'Mundo Binario', 'Axel Romero', 'Tech content creador', '0101010101', 'Puebla', NULL, '22000', 'Mexico', NULL, NULL, NULL)


--Crear trigger y guardar cliente en Reference
CREATE TRIGGER CustomersMonitoring
ON [dbo].[Customers]
AFTER INSERT, DELETE
AS
BEGIN
		DECLARE @customerID AS NCHAR(5)

		INSERT INTO Monitoring
		([TableName], [Transaction], [Reference])
		VALUES
		('Customers', 'INSERT', 'Se ha insertado el cliente ' + @customerID)
END

--Eliminar cliente
DELETE  FROM [Northwind].[dbo].[Customers]
WHERE [CustomerID]='MB' 

-- Modificar triger para detectar si es un INSERT o DELETE
ALTER TRIGGER [dbo].[CustomersMonitoring]
ON [dbo].[Customers]
AFTER INSERT, DELETE
AS
BEGIN
	
	DECLARE @customerID nchar(5)
	
	IF (SELECT COUNT(deleted.[CustomerID]) FROM deleted) > 0
	BEGIN
		SELECT @customerID = deleted.[CustomerID] FROM deleted

		INSERT INTO Monitoring
		([TableName], [Transaction], [Reference])
		VALUES
		('Customers', 'DELETE', 'Se ha eliminado el cliente ' + @customerID)
	END

	IF (SELECT COUNT(inserted.[CustomerID]) FROM inserted) > 0
	BEGIN
		SELECT @customerID = inserted.[CustomerID] FROM inserted

		INSERT INTO Monitoring
		([TableName], [Transaction], [Reference])
		VALUES
		('Customers', 'INSERT', 'Se ha insertado el cliente ' + @customerID)
	END

END