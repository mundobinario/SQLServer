SELECT * FROM [dbo].[Products]

INSERT INTO [dbo].[Products](product_code, product_description)
	OUTPUT
		inserted.product_id, inserted.product_code, inserted.product_description
VALUES
	('HBC', 'HOJA BLANCA TAMAÑO CARTA')
	,('HCC', 'HOJA DE COLOR TAMAÑO CARTA')
	,('ENG', 'ENGRAPADORA')


	DELETE FROM Products
	WHERE product_id>=7

	DBCC checkident ('Products', reseed, 6)


CREATE TABLE [dbo].[Brands]
(
	[brand_id]				UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY
	,[brand_name]			VARCHAR(50)	NOT NULL
	,[brand_description]	VARCHAR(50)	NULL
	,[brand_status]			BIT			NULL
)

INSERT INTO [dbo].[Brands]([brand_name], [brand_description], [brand_status])
	OUTPUT
		inserted.brand_id, inserted.brand_name
VALUES
	('HP', 'TECHNOLOGY', 1)
	,('DELL', 'TECHNOLOGY', 1)
	,('MAC', 'TECHNOLOGY', 1)
	,('LENOVO', 'TECHNOLOGY', 0)


