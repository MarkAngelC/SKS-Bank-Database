-- Group K
-- Mark Castro
-- Derek Carlos
-- Jeshua Arias Santos

--Populate DATA
-- Address
INSERT INTO Address VALUES
(1, '414 3 St SW', 'Calgary', 'AB'),
(2, '8500 Macleod Trail SE', 'Calgary', 'AB'),
(3, '407 2 Street SW', 'Calgary', 'AB'),
(4, '939 General Ave NE', 'Calgary', 'AB'),
(5, '10 Copperstone St SE', 'Calgary', 'AB');
GO

-- BankOffice
INSERT INTO BankOffice VALUES
(1, 'Central Office', 1),
(2, 'South Support Office', 2),
(3, 'North Operations Office', 3),
(4, 'West Admin Office', 4),
(5, 'East Financial Office', 5);
GO

-- Branch
INSERT INTO Branch VALUES
('B001', 'Calgary Financial Centre', 1, 100, 100),
('B002', '17th Ave. SE & Radisson', 2, 42, 37),
('B003', 'The Meadows', 3, 67, 21),
('B004', 'West Lethbridge', 4, 82, 76),
('B005', 'Timberlands', 5, 35, 28);
GO

-- EmployeeRole
INSERT INTO EmployeeRole VALUES
(1, 'Branch Manager'),
(2, 'Financial Advisor'),
(3, 'Teller'),
(4, 'Loan Specialist'),
(5, 'Customer Service Representative');
GO

-- Employee
INSERT INTO Employee VALUES
(1, 'Liam', 'Morales', '2021-10-04', NULL, 'B001', 1, 1, 1),
(2, 'Camila', 'Kelly', '2017-05-06', 1, 'B001', 1, 2, 2),
(3, 'Gabriel', 'Allen', '2015-09-01', 1, 'B002', 2, 3, 3),
(4, 'Quinn', 'Young', '2020-03-27', 3, 'B004', 4, 4, 3),
(5, 'Lydia', 'Parker', '2023-11-14', 2, 'B003', 3, 5, 5);
GO

-- Customer
INSERT INTO Customer VALUES
(1, 'Liam', 'Morales', 1, 1),
(2, 'Delphine', 'Crona', 2, 2),
(3, 'Gunnar', 'Padberg', 3, 3),
(4, 'Emil', 'Sauer', 4, 4),
(5, 'Brendan', 'Bartell', 5, 5),
(6, 'Isabell', 'Schmidt', 2, 1),
(7, 'Ottis', 'Heidenreich', 3, 2),
(8, 'Oswald', 'Mante', 5, 3),
(9, 'Monica', 'Koelpin', 1, 4),
(10, 'Dean', 'Grady', 4, 5);
GO

-- AccountType
INSERT INTO AccountType VALUES
(1, 'Chequing'),
(2, 'Savings');
GO

-- Account
INSERT INTO Account VALUES
(1, 2, 6000.00, '2025-05-06'),
(2, 1, 1570.76, '2025-09-28'),
(3, 2, 2367.98, '2025-01-26'),
(4, 1, 578.21, '2025-08-24'),
(5, 1, 121.67, '2025-10-16'),
(6, 2, 12167.24, '2024-12-28'),
(7, 1, 2367.21, '2025-07-11'),
(8, 2, 514.59, '2025-10-04'),
(9, 1, 897.24, '2025-06-17'),
(10, 2, 2213.67, '2025-04-20');
GO

-- CustomerAccount
INSERT INTO CustomerAccount VALUES
(1, 1), (2, 2), (3, 4), (4, 10), (5, 5),
(6, 8), (7, 6), (8, 9), (9, 7), (10, 3);
GO

-- SavingsAccount
INSERT INTO SavingsAccount VALUES
(1, 2.65),
(3, 4.95),
(6, 3.50),
(8, 4.70),
(10, 1.45);
GO

-- ChequingAccount
INSERT INTO ChequingAccount VALUES
(2, 385.12),
(4, 764.12),
(5, 546.93),
(7, 1420.64),
(9, 221.49);
GO

-- OverDraft
INSERT INTO OverDraft VALUES
(2, '2025-01-10', 120, 1001),
(4, '2025-02-14', 320, 1002),
(5, '2025-03-18', 90, 1003),
(7, '2025-04-20', 140, 1004),
(9, '2025-05-25', 50, 1005);
GO

-- Loan
INSERT INTO Loan VALUES
(1, 1671.89, 3.5, '2025-01-01', '2025-12-31'),
(2, 934.78, 4.0, '2025-03-01', '2025-09-30'),
(3, 1876.21, 2.9, '2025-02-15', '2025-10-15'),
(4, 1250.00, 3.2, '2025-04-01', '2025-11-01'),
(5, 3000.00, 5.0, '2025-05-01', '2026-05-01');
GO

-- LoanHolder
INSERT INTO LoanHolder VALUES
(1, 9),
(2, 1),
(3, 3),
(4, 7),
(5, 6);
GO

-- LoanPayment
INSERT INTO LoanPayment VALUES
(1, 1, 1, '2025-08-20', 267.21),
(2, 2, 1, '2025-09-21', 360.50),
(3, 3, 1, '2025-10-12', 678.23),
(4, 4, 1, '2025-08-07', 333.33),
(5, 5, 1, '2025-04-20', 2567.67);
GO