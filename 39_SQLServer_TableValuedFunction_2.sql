-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Axel Romero>
-- Create date: <06.12.2021>
-- Description:	<Mi primer función de tabla en SQL Server>
-- =============================================
CREATE FUNCTION [Purchasing].[PurchaseOrderTotalByVendor]
(	
	@year   AS INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		[poh].[VendorID]
		,[v].[Name]
		,DATENAME(MONTH, ([poh].[OrderDate]))	AS 'Month'
		,[poh].[TotalDue]						AS 'Total'
		,[poh].[Status]							AS 'Status'
	FROM	
		[Purchasing].[PurchaseOrderHeader] AS [poh]
		INNER JOIN [Purchasing].[Vendor] AS [v]
			ON [poh].[VendorID] = [v].[BusinessEntityID]
	WHERE
		YEAR([OrderDate]) = @year
)
GO
