USE SKSNationalBankDB;
GO


--Address Populate
INSERT INTO Address (address_id, street, city, province) VALUES
(1, '414 3 St SW', 'Calgary', 'AB'),
(2, '8500 Macleod Trail SE', 'Calgary', 'AB'),
(3, '407 2 Street SW', 'Calgary', 'AB'),
(4, '939 General Ave NE', 'Calgary', 'AB'),
(5, '10 Copperstone St SE', 'Calgary', 'AB');
GO

--Branch Populate
INSERT INTO Branch (branch_id, branch_name, address_id, total_deposit, total_loans) VALUES
('B001', 'Calgary Financial Centre', 1, 100, 100),
('B002', '17th Ave. SE & Radisson', 2, 42, 37),
('B003', 'The Meadows', 3, 67, 21),
('B004', 'West Lethbridge', 4, 82, 76),
('B005', 'Timberlands', 5, 35, 28);
GO

--Employee 
INSERT INTO Employee (employee_id, first_name, last_name, start_date, manager_id, branch_id) VALUES
(1, 'Liam', 'Morales', '2021-10-04', NULL, 'B001'),
(2, 'Camila', 'Kelly', '2017-05-06', 1, 'B001'),
(3, 'Gabriel', 'Allen', '2015-09-01', 1, 'B002'),
(4, 'Quinn', 'Young', '2020-03-27', 3, 'B004'),
(5, 'Lydia', 'Parker', '2023-11-14', 2, 'B003');
GO

--Account Type
INSERT INTO AccountType (account_type_id, type) VALUES
(1, 'Chequing'),
(2, 'Savings');
GO

--Account

INSERT INTO Account (account_id, account_type_id, balance, open_date) VALUES
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

--Customer
INSERT INTO Customer (customer_id, first_name, last_name, address_id) VALUES
(1, 'Liam', 'Morales', 1),
(2, 'Delphine', 'Crona', 2),
(3, 'Gunnar', 'Padberg', 3),
(4, 'Emil', 'Sauer', 4),
(5, 'Brendan', 'Bartell', 5),
(6, 'Isabell', 'Schmidt', 1),
(7, 'Ottis', 'Heidenreich', 2),
(8, 'Oswald', 'Mante', 3),
(9, 'Monica', 'Koelpin', 4),
(10, 'Dean', 'Grady', 5);
GO

--CustomerAccount
INSERT INTO CustomerAccount (customer_id, account_id) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 10),
(5, 5),
(6, 8),
(7, 6),
(8, 9),
(9, 7),
(10, 3);
GO


-- SavingsAccount
INSERT INTO SavingsAccount (account_id, interest_rate) VALUES
(1, 2.65),
(3, 4.95),
(6, 3.50),
(8, 4.70),
(10, 1.45);
GO


-- ChequingAccount
INSERT INTO ChequingAccount (account_id, overdraft_limit) VALUES
(2, 385.12),
(4, 764.12),
(5, 546.93),
(7, 1420.64),
(9, 221.49);
GO


-- Loan
INSERT INTO Loan (loan_id, amount, interest_rate, start_date, end_date, account_id) VALUES
(1, 1671.89, 3.5, '2025-01-01', '2025-12-31', 1),
(2, 934.78, 4.0, '2025-03-01', '2025-09-30', 3),
(3, 1876.21, 2.9, '2025-02-15', '2025-10-15', 6),
(4, 1250.00, 3.2, '2025-04-01', '2025-11-01', 8),
(5, 3000.00, 5.0, '2025-05-01', '2026-05-01', 10);
GO


-- LoanHolder
INSERT INTO LoanHolder (loan_id, customer_id) VALUES
(1, 9),
(2, 1),
(3, 3),
(4, 7),
(5, 6);
GO


-- LoanPayment
INSERT INTO LoanPayment (loan_id, payment_date, amount) VALUES
(1, '2025-08-20', 267.21),
(2, '2025-09-21', 360.50),
(3, '2025-10-12', 678.23),
(4, '2025-08-07', 333.33),
(5, '2025-04-20', 2567.67);
GO


-- CustomerEmployee
INSERT INTO CustomerEmployee (customer_id, employee_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
GO

-- EmployeeAddress
INSERT INTO EmployeeAddress (employee_id, address_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
GO
