BEGIN TRY
	DECLARE @result INT
	-- Generar error al dividir un número entre 0 
	SET @result = 100/0
END TRY
BEGIN CATCH
	DECLARE
		@ErMessage NVARCHAR(2048),
		@ErSeverity INT,
		@ErState INT
 
	SELECT
		@ErMessage = ERROR_MESSAGE(),
		@ErSeverity = ERROR_SEVERITY(),
		@ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH



BEGIN TRY
	DECLARE @resultDiv INT
	-- Generar error al dividir un número entre 0 
	SET @resultDiv = 100/0
END TRY
BEGIN CATCH
    THROW
END CATCH

-- Differences

BEGIN
 PRINT 'BEFORE RAISERROR'
 RAISERROR('RAISERROR TEST',16,1)
 PRINT 'AFTER RAISERROR'
END


BEGIN
    PRINT 'BEFORE THROW';
    THROW 50000,'THROW TEST',1
    PRINT 'AFTER THROW'
END







-- Add customize message

EXEC sys.sp_addmessage
		@msgnum = 50001
		,@severity = 11
		,@msgtext = 'TEST binario'

RAISERROR(50001,11,1)

EXEC sys.sp_dropmessage
	@msgnum = 50001

SELECT * FROM master.dbo.sysmessages


-- Example (official book)

CREATE OR ALTER PROC dbo.Divide
	@dividend AS INT,
	@divisor AS INT
AS
	SET NOCOUNT ON;
	BEGIN TRY
	
		SELECT @dividend / @divisor AS quotient, @dividend % @divisor AS remainder;
	END TRY
	
	BEGIN CATCH
		PRINT 'Error occurred when trying to compute the division '
		+ CAST(@dividend AS VARCHAR(11)) + ' / ' + CAST(@divisor AS VARCHAR(11)) + '.’';
		
		DECLARE
		@ErMessage NVARCHAR(2048),
		@ErSeverity INT,
		@ErState INT
 
		SELECT
			@ErMessage = ERROR_MESSAGE(),
			@ErSeverity = ERROR_SEVERITY(),
			@ErState = ERROR_STATE()
 
		 RAISERROR (@ErMessage,
					 @ErSeverity,
					 @ErState )

		PRINT 'This does not execute.';

END CATCH;
GO




EXEC dbo.Divide @dividend = 11, @divisor = 2;

EXEC dbo.Divide @dividend = 11, @divisor = 0;