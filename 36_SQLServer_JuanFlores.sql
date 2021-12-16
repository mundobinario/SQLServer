	DECLARE @Productos AS TABLE
	(
		ProductoID		INT  PRIMARY KEY
		,Descripcion	VARCHAR(50)
	)

	DECLARE @Ventas AS TABLE
	(
		VentaID			INT IDENTITY(1,1) PRIMARY KEY
		,ProductoID		INT
		,Cantidad		INT
		,MovimientoID	VARCHAR(2)
	)

	DECLARE @Compras AS TABLE
	(
		CompraID		INT IDENTITY(1,1) PRIMARY KEY
		,ProductoID		INT
		,Cantidad		INT
		,MovimientoID	VARCHAR(2)
	)

	DECLARE @Movimientos AS TABLE
	(
		MovimientoID	VARCHAR(2)
		,Descripcion		VARCHAR(50)
	)

INSERT INTO @Productos
VALUES
(100, 'DELL P2719HC')

INSERT INTO @Movimientos
VALUES
('FA', 'FACTURAS')
,('DF', 'DEVOLUCIONES')

INSERT INTO @Ventas
VALUES
(100,10,'FA')
,(100,20,'FA')
,(100,30,'FA')
,(100,-20,'DF')
,(100,-20,'DF')

INSERT INTO @Compras
VALUES
(100,100,'FA')
,(100,25,'FA')
,(100,50,'FA')
,(100,-20,'DF')
,(100,-5,'DF')

---- Moviemiento positivos
;WITH CTE_Movimientos AS
(
SELECT 
	[p].[ProductoID]
	,[P].[Descripcion]		AS [Producto]
	,SUM([c].[Cantidad] )	AS [Cantidad]	
	,'Entradas'				AS [Identificador]
FROM 
	@Productos [p]
	INNER JOIN @Compras AS [c]
		ON [p].[ProductoID] = [c].[ProductoID]
		AND [c].[MovimientoID] = 'FA'		
GROUP BY
	[p].[ProductoID]
	,[p].[Descripcion]
UNION 
SELECT 
	[p].[ProductoID]
	,[P].[Descripcion]			AS [Producto]
	,SUM([v].[Cantidad] *-1)	AS [Cantidad]	
	,'Entradas'					AS [Identificador]
FROM 
	@Productos [p]
	INNER JOIN @Ventas AS [v]
		ON [p].[ProductoID] = [v].[ProductoID]
		AND [v].[MovimientoID] = 'DF'		
GROUP BY
	[p].[ProductoID]
	,[p].[Descripcion]
UNION 
SELECT 
	[p].[ProductoID]
	,[P].[Descripcion]		AS [Producto]
	,SUM([c].[Cantidad] )	AS [Cantidad]	
	,'Salidas'				AS [Identificador]
FROM 
	@Productos [p]
	INNER JOIN @Compras AS [c]
		ON [p].[ProductoID] = [c].[ProductoID]
		AND [c].[MovimientoID] = 'DF'		
GROUP BY
	[p].[ProductoID]
	,[p].[Descripcion]
UNION 
SELECT 
	[p].[ProductoID]
	,[P].[Descripcion]			AS [Producto]
	,SUM([v].[Cantidad] *-1)	AS [Cantidad]	
	,'Salidas'					AS [Identificador]
FROM 
	@Productos [p]
	INNER JOIN @Ventas AS [v]
		ON [p].[ProductoID] = [v].[ProductoID]
		AND [v].[MovimientoID] = 'FA'		
GROUP BY
	[p].[ProductoID]
	,[p].[Descripcion]
)



SELECT [ProductoID]
		, [Producto]
		,SUM(Cantidad) AS [Stock]
FROM 
	CTE_Movimientos
GROUP BY
	[ProductoID]
	,[Producto]

SELECT * FROM @Ventas
SELECT * FROM @Compras
