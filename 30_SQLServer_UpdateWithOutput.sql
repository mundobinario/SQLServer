UPDATE [dbo].[Brands]
	SET [brand_name] = 'LENOVO NEW'
	OUTPUT 
		inserted.brand_id
		,deleted.brand_name
		,inserted.brand_name
WHERE [brand_name]='LENOVO'


select * from [dbo].[Brands]

--many joins