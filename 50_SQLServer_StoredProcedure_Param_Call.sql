DECLARE @count		AS INT
DECLARE @message	AS VARCHAR(100)

EXEC [Sales].[uspGetCreditCaredExpiredByMonth]
	@i_month =  10
	,@i_cardType = 'SuperiorCard'
	,@o_count	= @count OUTPUT
	,@o_message = @message OUTPUT
		

SELECT @count AS [RegistrosAfectados], @message AS [Message]