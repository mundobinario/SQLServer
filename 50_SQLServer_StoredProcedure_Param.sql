USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [Sales].[uspGetCreditCaredExpiredByMonth]    Script Date: 22/04/2022 11:43:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Axel Romero>
-- Create date: <21.04.2022>
-- Description:	<Return data from [Sales].[CreditCard] when the month is 4 and actual year.>
-- =============================================
ALTER PROCEDURE [Sales].[uspGetCreditCaredExpiredByMonth]
	@i_month		INT
	,@i_cardType	NVARCHAR(50)
	,@o_count		INT				= 0		OUTPUT
	,@o_message		VARCHAR(100)	= ''	OUTPUT
AS
BEGIN

	--1. Delete info from [CreditCardNotification]
	PRINT 'Step 1. Delete info'
	DELETE FROM
	[Sales].[CreditCardNotification]

	--2. Insert info to send notification
	PRINT 'Step 2. Insert info'
	INSERT INTO [Sales].[CreditCardNotification]
	SELECT 
		[cc].[CardNumber]
		,1
	FROM 
		[Sales].[CreditCard] AS [cc]
	WHERE
		[cc].[ExpYear] = YEAR(GETDATE())
		AND [ExpMonth] = @i_month
		AND [CardType] = @i_cardType

	--3. Show information (Count)
	SELECT 
		@o_count = COUNT([cc].[CardNumber])
	FROM 
		[Sales].[CreditCard] AS [cc]
	WHERE
		[cc].[ExpYear] = YEAR(GETDATE())
		AND [ExpMonth] = @i_month
		AND [CardType] = @i_cardType

	--4. Return message
	SET @o_message = 'The process was executed.'
END
