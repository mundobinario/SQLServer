CREATE TYPE Bibliography AS TABLE (
    [Title] NVARCHAR(100) NOT NULL,
    [Author] NVARCHAR(100) NOT NULL,
    [PublicationYear] INT NOT NULL
);

CREATE PROCEDURE GetBibliograhy
	@table Bibliography READONLY
AS
BEGIN
	SELECT * FROM @table
END
GO


DECLARE @myTable Bibliography

INSERT INTO @myTable
VALUES
('Una visita inesperada', 'Agatha Christie', '1956')
,('Diez negritos', 'Agatha Christie', '1939')


EXEC GetBibliograhy @myTable



