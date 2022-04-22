-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Axel Romero>
-- Create date: <20.04.2022>
-- Description:	<Return data from [Sales].[CreditCard] when the month is 4 and actual year.>
-- =============================================
CREATE PROCEDURE [Sales].[uspGetCreditCardExpiredApril] 
AS
BEGIN
	--SELECT 
	--	* 
	--FROM 
	--	[Sales].[CreditCard] AS [cc]
	--WHERE
	--	[cc].[ExpYear] = YEAR(GETDATE())
	--	AND [ExpMonth] = 4
	--	AND [CardType] = 'SuperiorCard'

	INSERT INTO [Sales].[CreditCardNotifications]
	SELECT 
		[cc].[CardNumber]
		,1
	FROM 
		[Sales].[CreditCard] AS [cc]
	WHERE
		[cc].[ExpYear] = YEAR(GETDATE())
		AND [ExpMonth] = 4
		AND [CardType] = 'SuperiorCard'
END
GO
