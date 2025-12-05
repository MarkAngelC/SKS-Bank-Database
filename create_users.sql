-- Group K
-- Mark Castro
-- Derek Carlos
-- Jeshua Arias Santos



USE master;
GO


-- 1. CREATE CUSTOMER USER  (customer_group_K)

-- Create login
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'customer_group_K')
    CREATE LOGIN customer_group_K WITH PASSWORD = 'customer';
GO

USE SKSNationalBankDB;
GO

-- Create database user
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'customer_group_K')
    CREATE USER customer_group_K FOR LOGIN customer_group_K;
GO

-------------------------------------------------------------
-- CUSTOMER PERMISSIONS 
-------------------------------------------------------------
-- Customer, CustomerAccount, Account, AccountType,
-- LoanHolder, Loan, LoanPayment, SavingsAccount,
-- ChequingAccount, OverDraft

GRANT SELECT ON dbo.Customer TO customer_group_K;
GRANT SELECT ON dbo.CustomerAccount TO customer_group_K;
GRANT SELECT ON dbo.Account TO customer_group_K;
GRANT SELECT ON dbo.AccountType TO customer_group_K;
GRANT SELECT ON dbo.LoanHolder TO customer_group_K;
GRANT SELECT ON dbo.Loan TO customer_group_K;
GRANT SELECT ON dbo.LoanPayment TO customer_group_K;
GRANT SELECT ON dbo.SavingsAccount TO customer_group_K;
GRANT SELECT ON dbo.ChequingAccount TO customer_group_K;
GRANT SELECT ON dbo.OverDraft TO customer_group_K;

-- Deny any type of modification
DENY INSERT, UPDATE, DELETE ON SCHEMA::dbo TO customer_group_K;
GO



-- 2. CREATE ACCOUNTANT USER  (accountant_group_K)

-- Create login
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'accountant_group_K')
    CREATE LOGIN accountant_group_K WITH PASSWORD = 'accountant';
GO

USE SKSNationalBankDB;
GO

-- Create user
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'accountant_group_K')
    CREATE USER accountant_group_K FOR LOGIN accountant_group_K;
GO



-- ACCOUNTANT PERMISSIONS
-- Grant read access to the entire database
GRANT SELECT ON SCHEMA::dbo TO accountant_group_K;

-- Revoke modification rights on ACCOUNT/LOAN related tables
DENY INSERT, UPDATE, DELETE ON dbo.Account TO accountant_group_K;
DENY INSERT, UPDATE, DELETE ON dbo.AccountType TO accountant_group_K;
DENY INSERT, UPDATE, DELETE ON dbo.ChequingAccount TO accountant_group_K;
DENY INSERT, UPDATE, DELETE ON dbo.SavingsAccount TO accountant_group_K;
DENY INSERT, UPDATE, DELETE ON dbo.OverDraft TO accountant_group_K;
DENY INSERT, UPDATE, DELETE ON dbo.Loan TO accountant_group_K;
DENY INSERT, UPDATE, DELETE ON dbo.LoanPayment TO accountant_group_K;
DENY INSERT, UPDATE, DELETE ON dbo.LoanHolder TO accountant_group_K;

GO



-- 3. TEST 

PRINT '--- TESTING AS customer_group_K ---';
EXECUTE AS USER = 'customer_group_K';

-- test1 should success
SELECT TOP 1 * FROM Customer;
SELECT TOP 1 * FROM Account;
SELECT TOP 1 * FROM Loan;

-- test2 should fail
BEGIN TRY
    INSERT INTO Customer (customer_id, first_name, last_name, employee_id, address_id)
    VALUES (999, 'TEST', 'FAIL', 1, 1);
END TRY
BEGIN CATCH
    PRINT 'INSERT failed as expected for customer_group_K.';
END CATCH;

REVERT;
GO



PRINT '--- TESTING AS accountant_group_K ---';
EXECUTE AS USER = 'accountant_group_K';

-- test1
SELECT TOP 1 * FROM Branch;
SELECT TOP 1 * FROM Employee;

-- test2
BEGIN TRY
    UPDATE Account SET balance = 99999 WHERE account_id = 1;
END TRY
BEGIN CATCH
    PRINT 'UPDATE failed as expected for accountant_group_K.';
END CATCH;

REVERT;
GO
