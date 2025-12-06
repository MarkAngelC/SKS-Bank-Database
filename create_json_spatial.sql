-- Group K
-- Mark Castro
-- Derek Carlos
-- Jeshua Arias Santos

USE SKSNationalBankDB;
GO


-- 1) Add JSON column to Customer

IF COL_LENGTH('dbo.Customer', 'additional_info') IS NULL
BEGIN
    ALTER TABLE dbo.Customer
    ADD additional_info NVARCHAR(MAX) NULL;
END;
GO

-- Populate sample JSON data for some customers
UPDATE dbo.Customer
SET additional_info = JSON_QUERY('{"preferred_contact":"email","marketing_opt_in":true,"vip_level":"gold"}')
WHERE customer_id = 1;

UPDATE dbo.Customer
SET additional_info = JSON_QUERY('{"preferred_contact":"phone","marketing_opt_in":false,"notes":"prefers statements by mail"}')
WHERE customer_id = 2;

UPDATE dbo.Customer
SET additional_info = JSON_QUERY('{"preferred_contact":"email","marketing_opt_in":true,"notes":"frequent loan applicant"}')
WHERE customer_id = 3;
GO

-- Verify JSON data
SELECT customer_id, first_name, last_name, additional_info
FROM dbo.Customer
WHERE customer_id IN (1,2,3);
GO


-- 2) Add spatial column to Branch
IF COL_LENGTH('dbo.Branch', 'branch_location') IS NULL
BEGIN
    ALTER TABLE dbo.Branch
    ADD branch_location GEOGRAPHY NULL;
END;
GO

-- Populate sample branch locations
UPDATE dbo.Branch
SET branch_location = GEOGRAPHY::STPointFromText('POINT(-114.0708 51.0450)', 4326)
WHERE branch_id = 'B001';

UPDATE dbo.Branch
SET branch_location = GEOGRAPHY::STPointFromText('POINT(-114.0550 51.0380)', 4326)
WHERE branch_id = 'B002';

UPDATE dbo.Branch
SET branch_location = GEOGRAPHY::STPointFromText('POINT(-114.0430 51.0410)', 4326)
WHERE branch_id = 'B003';

UPDATE dbo.Branch
SET branch_location = GEOGRAPHY::STPointFromText('POINT(-113.9920 50.9840)', 4326)
WHERE branch_id = 'B004';

UPDATE dbo.Branch
SET branch_location = GEOGRAPHY::STPointFromText('POINT(-114.1300 51.0100)', 4326)
WHERE branch_id = 'B005';
GO

-- Verify spatial data
SELECT branch_id, branch_name, branch_location.ToString() AS location_wkt
FROM dbo.Branch;
GO

PRINT 'JSON and spatial columns added and populated according to ERD.';

