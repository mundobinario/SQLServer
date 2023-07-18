-- Crear tabla sin llave primaria
CREATE TABLE [dbo].[Countries]
(
	[CountryID]			VARCHAR(2)		NOT NULL
	,[CountryName]		VARCHAR(100)	NOT NULL
	,[CountryStatus]	BIT				NOT NULL
)

-- Insertar datos a la tabla
--	ISO 3166-1 alpha2: codes are two-letter country codes defined in ISO 3166-1

INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('MX', 'México', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('CO', 'Colombia', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('AR', 'Argentina', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('PE', 'Perú', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('VE', 'Venezuela', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('MT', 'Malta', 0)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('YT', 'Mayotte', 0)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('UY', 'Uruguay', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('ES', 'España', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('EG', 'Egipto', 0)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('EC', 'Ecuador', 1)
INSERT INTO [dbo].[Countries] ([CountryID], [CountryName], [CountryStatus]) VALUES ('MA', 'Marruecos', 0)

-- Seleccionar data de la tabla countries
SELECT [CountryID], [CountryName], [CountryStatus] FROM [dbo].[Countries]

-- Verificar los indices que tiene una tabla
EXECUTE sp_helpindex 'Countries'

-- Crear INDICE ORDENADO
CREATE CLUSTERED INDEX IDX_Countries_CountryName
ON [dbo].[Countries] ([CountryName])

-- Seleccionar data de la tabla countries
SELECT [CountryID], [CountryName], [CountryStatus] FROM [dbo].[Countries]

-- Verificar los indices que tiene una tabla
EXECUTE sp_helpindex 'Countries'

-- Crear INDICE NO AGRUPADO
CREATE NONCLUSTERED INDEX IDX_Countries_CountryID
ON [dbo].[Countries] ([CountryID])

-- Seleccionar todas las columnas de la tabla countries
SELECT * FROM [dbo].[Countries]

-- Seleccionar data de la tabla countries
SELECT [CountryID], [CountryName] FROM [dbo].[Countries]



