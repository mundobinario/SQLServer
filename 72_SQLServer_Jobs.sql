
--Script para JOB de backup
USE Northwind
GO
BACKUP DATABASE [Northwind]
TO  DISK = N'C:\Backup\Northwind.bak'
WITH CHECKSUM;


--Script para JOB de Monitoring
DELETE FROM [dbo].[Monitoring]