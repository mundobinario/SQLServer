-- Concatenar nombre con apellido en una columna calculada
ALTER TABLE [HumanResources].[Employees]
ADD FullName AS CONCAT([LastName], ', ' + [FirstName])


-- Obtener años entre dos fechas.
SELECT DATEDIFF(YEAR, '2010-01-01',GETDATE())

-- Calcular edad con base a la fecha de nacimiento y fecha del servidor. 
ALTER TABLE [HumanResources].[Employees]
ADD Age AS DATEDIFF(YEAR, [BirthDate], GETDATE())

--SELECT * FROM [HumanResources].[Employees]
--WHERE [Age]>60


-- Insertar orden 
INSERT INTO [dbo].[Orders]
([CustomerID],[EmployeeID],[OrderDate],[RequiredDate],[ShippedDate],[ShipVia],[Freight],[ShipName],[ShipAddress],[ShipCity],[ShipRegion],[ShipPostalCode],[ShipCountry])
VALUES
('LILAS',1,GETDATE(), '2023-03-22', NULL,1, 10.50, 'LILAS CDMX', 'Av. Constitución 15', 'CDMX', 'CDMX', '93000', 'México')


-- Calcular días restantes para fecha requerida por parte del cliente (V1)
ALTER TABLE [dbo].[Orders]
ADD RemainingDays AS DATEDIFF(DAY, [RequiredDate],GETDATE())


-- Calcular días restantes para fecha requerida por parte del cliente (V2)
ALTER TABLE [dbo].[Orders]
ADD RemainingDays2 AS 
(
	CASE WHEN [RequiredDate] < GETDATE() THEN 
		0 
	ELSE 
		DATEDIFF(DAY, [RequiredDate],GETDATE()) 
	END
) 

-- Calcular días restantes para fecha requerida por parte del cliente (V3)
ALTER TABLE [dbo].[Orders]
ADD RemainingDays3 AS 
(
	CASE WHEN [RequiredDate] < GETDATE() THEN 
		0 
	ELSE 
		(DATEDIFF(DAY, [RequiredDate],GETDATE())) * -1
	END
) 



