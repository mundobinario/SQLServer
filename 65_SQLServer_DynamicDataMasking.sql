-- 1. DEFAULT Takes the default mask of the data type (not of the DEFAULT constraint of the column, but the data type).
-- 2. EMAIL Masks the email so you only see a few meaningful characters.
-- 3. RANDOM Masks any of the numeric data types (int, smallint, decimal, etc) with a random value within a range.
-- 4. PARTIAL Allows you to take values from the front and back of a value, replacing the center with a fixed string value

-- 1. DEFAULT
ALTER TABLE [Employees]
ALTER COLUMN FirstName NVARCHAR(10) MASKED WITH (FUNCTION = 'default()')

CREATE USER aromero WITHOUT Login;
GRANT SELECT ON [Employees] TO aromero

EXECUTE AS User = 'aromero';
SELECT * FROM [Employees]


-- 2. EMAIL
ALTER TABLE [Employees]
ADD [Email] NVARCHAR(100) NULL

ALTER TABLE [Employees]
ALTER COLUMN [Email] NVARCHAR(100) MASKED WITH (FUNCTION = 'email()')

EXECUTE AS User = 'aromero';
SELECT * FROM [Employees]


-- 3. RANDOM
--ALTER TABLE [Employees]
--ALTER COLUMN [Extension] NVARCHAR(4) MASKED WITH (FUNCTION = 'random(1,5)')

ALTER TABLE [Employees]
ALTER COLUMN [Extension] INT NULL

ALTER TABLE [Employees]
ALTER COLUMN [Extension] INT MASKED WITH (FUNCTION = 'random(1,5)')

EXECUTE AS User = 'aromero';
SELECT * FROM [Employees]
REVERT

-- 4. PARTIAL
ALTER TABLE [Employees]
ALTER COLUMN [Address] NVARCHAR(60) MASKED WITH (FUNCTION = 'partial(1,"***",1)')

EXECUTE AS User = 'aromero';
SELECT * FROM [Employees]

REVERT


-- 5. DATETIME
ALTER TABLE [Employees]
ALTER COLUMN [BirthDate] DATETIME MASKED WITH (FUNCTION = 'datetime("Y")')

EXECUTE AS User = 'aromero';
SELECT * FROM [Employees]

REVERT

--Reference:
--https://learn.microsoft.com/en-us/sql/relational-databases/security/dynamic-data-masking?view=sql-server-ver16