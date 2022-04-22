CREATE TABLE [Sales].[CreditCardNotifications]
(
	[BusinessEntityID]	INT IDENTITY(1,1) PRIMARY KEY
	,[CardNumber]		VARCHAR(25)
	,[NotificationType]	INT
)