CREATE TABLE [dbo].[Countries]
(
	[CountryID]				VARCHAR(2)		NOT NULL
	,[CountryName]			VARCHAR(100)	NOT NULL
	,[CountryStatus]		BIT				NOT NULL
	,[CountryPopulation]	INT				NOT NULL CHECK([CountryPopulation] > 0)
)


INSERT INTO 
[dbo].[Countries] ([CountryID], [CountryName], [CountryStatus], [CountryPopulation])
VALUES
('MX', 'México', 1, 126000)

INSERT INTO 
[dbo].[Countries] ([CountryID], [CountryName], [CountryStatus], [CountryPopulation])
VALUES ('CO', 'Colombia', 1, 0)

INSERT INTO
[dbo].[Countries] ([CountryID], [CountryName], [CountryStatus], [CountryPopulation])
VALUES ('AR', 'Argentina', 1, 0)


-- Ver las restricciones activas de la tabla
SELECT 
    name,
    is_disabled,
    is_not_trusted,
    definition,
    OBJECT_NAME(parent_object_id) AS TableName
FROM sys.check_constraints
WHERE OBJECT_NAME(parent_object_id)= 'Countries'

-- Deshabilitar una restricción
ALTER TABLE Countries
NOCHECK CONSTRAINT [CK__Countries__Count__5224328E];   


-- Habilitar una restricción
ALTER TABLE Countries
CHECK CONSTRAINT [CK__Countries__Count__5224328E];   

--Agregar un check a una tabla existente
ALTER TABLE [HumanResources].[Employees]
ADD CONSTRAINT [BirthDate] CHECK((datediff(year,[BirthDate],getdate())) >= 18);

INSERT INTO [HumanResources].[Employees]
([LastName],[FirstName],[Title],[TitleOfCourtesy],[BirthDate],[HireDate],[Address],[City],[Region],[PostalCode]
,[Country],[HomePhone],[Extension],[Photo],[Notes],[ReportsTo],[PhotoPath]) 
VALUES
('Davolio','Nancy','Sales Representative','Ms.','01/01/2000','05/01/1992','507 - 20th Ave. E.
Apt. 2A','Seattle','WA','98122','USA','(206) 555-9857','5467',NULL,'Education includes a BA in psychology from Colorado State University in 1970.  She also completed "The Art of the Cold Call."  Nancy is a member of Toastmasters International.',2,'http://accweb/emmployees/davolio.bmp')
