CREATE TYPE TypeMoney FROM MONEY;

CREATE TABLE [dbo].[Sales] (
    [SaleID] INT PRIMARY KEY,
    [SaleDate] DATETIME,
    [SaleTotal] TypeMoney
);


INSERT INTO [dbo].[Sales] 
([SaleID], [SaleDate] , [SaleTotal])
VALUES (1, GETDATE(), 50.25);




CREATE TYPE PhoneNumber FROM VARCHAR(20) NOT NULL;

CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Phone PhoneNumber NULL
);


INSERT INTO Customers2 (CustomerID, CustomerName, Phone)
VALUES (1, 'John Doe', '123-456-7890');

SELECT * FROM Customers2;

UPDATE Customers2
SET Phone = NULL
WHERE CustomerID = 1;
