USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedFunction [dbo].[Inventory]    Script Date: 06/12/2021 11:36:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [dbo].[Inventory] 
(	
	@productID AS INT
)
RETURNS TABLE 
AS
RETURN 
(
	
SELECT 
		1000		AS  [LocationID]
		,[ProductID]
      ,SUM([Quantity]) AS TotalStockQuantity
  FROM [AdventureWorks2019].[Production].[ProductInventory]
WHERE 
ProductID=@productID
GROUP BY 
	[ProductID]
UNION ALL
SELECT 
		[LocationID]		AS  [LocationID]
		,[ProductID]
      ,SUM([Quantity]) AS TotalStockQuantity
  FROM [AdventureWorks2019].[Production].[ProductInventory]
  WHERE 
ProductID=@productID
GROUP BY 
	[ProductID]
	,LocationID
)
