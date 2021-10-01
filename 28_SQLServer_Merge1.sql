--CREATE TABLE StudentsC1(
--    StudentID		INT
--    ,StudentName	VARCHAR(50)
--    ,StudentStatus	BIT
--);

--SELECT * FROM [dbo].[StudentsC1];
--SELECT * FROM [dbo].[StudentsC2];

--INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
--INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
--INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
--INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
--INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)

--CREATE TABLE StudentsC2(
--    StudentID		INT
--    ,StudentName	VARCHAR(50)
--    ,StudentStatus	BIT
--);

--INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
--INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
--INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
--INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)



SELECT * FROM StudentsC1
SELECT * FROM StudentsC2


MERGE StudentsC1 AS [tgt]
USING
(
	SELECT
		[s].[StudentID]
		,[s].[StudentName]
		,[s].[StudentStatus]
	FROM 
		StudentsC2 AS [s]
) AS [src]
ON
(
	[src].[StudentID] = [tgt].[StudentID]
)
-- For updates
WHEN MATCHED THEN
	UPDATE 
		SET
			[tgt].[StudentName] = [src].[StudentName]
			,[tgt].[StudentStatus] = [src].[StudentStatus]
-- For Inserts
WHEN NOT MATCHED THEN
	INSERT
	(
		[StudentID], [StudentName], [StudentStatus]
	)
	VALUES
	(
		[src].[StudentID], [src].[StudentName], [src].[StudentStatus]

	);


