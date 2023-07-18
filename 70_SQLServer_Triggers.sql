-- Agregar columna a la tabla de clientes
ALTER TABLE [dbo].[Customers]
ADD LastOrderDate DATETIME;

-- Crear trigger
CREATE TRIGGER UpdateLastOrder
ON [dbo].[Orders]
AFTER INSERT
AS
BEGIN
    UPDATE [c]
    SET [c].[LastOrderDate] = GETDATE()
    FROM [dbo].[Customers] AS [c]
    INNER JOIN inserted AS [i] ON [c].[CustomerID] = [i].[CustomerID]
END


-- Insertar orden
INSERT INTO [dbo].[Orders]
([CustomerID])
VALUES
('AROUT')


-- Deshabilitar trigger
DISABLE TRIGGER [UpdateLastOrder] ON [dbo].[Orders];

-- Habilitar trigger
ENABLE TRIGGER [UpdateLastOrder] ON [dbo].[Orders];