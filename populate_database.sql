USE SKS_NationalBank;

	SET IDENTITY_INSERT Branch ON;

INSERT INTO Branch(BranchID, BranchName, City, TotalDeposits, TotalLoans) VALUES
(1, 'Calgary Financial Centre', 'Calgary', 100, 100),
(2, '17th Ave. Se & Radisson', 'Calgary', 42, 37),
(3, 'The Meadows', 'Edmonton', 67, 21),
(4, 'West Lethbridge', 'Lethbridge', 82, 76),
(5, 'Timberlands', 'Red Deer', 35, 28);

	SET IDENTITY_INSERT Branch OFF;

	SET IDENTITY_INSERT Employee ON;

INSERT INTO Employee(EmployeeID, FullName, HomeAddress, StartDate, ManagerID) VALUES
(1, 'Liam Morales', '414 3 St SW #203, Calgary, AB T2P 1R2, Canada', '2021-10-04 13:51:00', 1),
(2, 'Camila Kelly', '8500 Macleod Trail SE #232, Calgary, AB T2H 2N1, Canada', '2017-05-06 13:51:00', 2),
(3, 'Gabriel Allen', '407 2 Street Southwest, Calgary, AB T2P 2Y3, Canada', '2015-09-01 13:51:00', 1),
(4, 'Quinn Young', '939 General Ave NE, Calgary, AB T2E 9E1, Canada', '2020-03-27 13:51:00', 3),
(5, 'Lydia Parker', '10 Copperstone St SE unit 119, Calgary, AB T2Z 0V4, Canada', '2023-11-14 13:51:00', 2);

	SET IDENTITY_INSERT Employee OFF;

	SET IDENTITY_INSERT Location ON;

INSERT INTO Location (LocationID, LocationName, IsBranch) VALUES
(1, 'Calgary Financial Centre', 1),
(2, 'CF Chinook Centre', 0),
(3, 'Timberlands', 1),
(4, 'West Lethbridge', 1),
(5, 'West Edmonton Mall', 0);

	SET IDENTITY_INSERT Location OFF;

INSERT INTO EmployeeLocation (EmployeeID, LocationID) VALUES
(1, 1),
(2, 5),
(3, 1),
(4, 4),
(5, 2);

	SET IDENTITY_INSERT Customer ON;

INSERT INTO Customer(CustomerID, FullName, HomeAddress) VALUES
(1, 'Liam Morales', '414 3 St SW #203, Calgary, AB T2P 1R2, Canada'),
(2, 'Delphine Crona', 'Suite C-7070 Farrell Rd SE, Calgary, AB T2H 0T2, Canada'),
(3, 'Gunnar Padberg', '1717 10 St NW Suite 300, Calgary, AB T2M 4S2, Canada'),
(4, 'Emil Sauer', '602 12 Ave SW Suite 910, Calgary, AB T2R 1J3, Canada'),
(5, 'Brendan Bartell', '405-999 8 St SW, Calgary, AB T2R 1J5, Canada'),
(6, 'Isabell Schmidt', '565 36 St NE, Calgary, AB T2A 6K3, Canada'),
(7, 'Ottis Heidenreich', '10655 Southport Rd SW Suite B1, Calgary, AB T2W 4Y1, Canada'),
(8, 'Oswald Mante', '880 16 Ave SW, Calgary, AB T2R 0S9, Canada'),
(9, 'Monica Koelpin', '10401 Braeside Dr SW, Calgary, AB T2W 1B5, Canada'),
(10, 'Dean Grady', '1130 12 St SW, Calgary, AB T3C 1A7, Canada');

	SET IDENTITY_INSERT Customer OFF;

	SET IDENTITY_INSERT Account ON;

INSERT INTO Account(AccountID, AccountType, Balance, LastAccessed) VALUES
(1, 'Savings', 6000.00, '2025-05-06 13:51:00'),
(2, 'Chequing', 1570.76, '2025-09-28 13:51:00'),
(3, 'Savings', 2367.98, '2025-01-26 13:51:00'),
(4, 'Chequing', 578.21, '2025-08-24 13:51:00'),
(5, 'Chequing', 121.67, '2025-10-16 13:51:00'),
(6, 'Savings', 12167.24, '2024-12-28 13:51:00'),
(7, 'Chequing', 2367.21,'2025-07-11 13:51:00'),
(8, 'Savings', 514.59, '2025-10-04 13:51:00'),
(9, 'Chequing', 897.24, '2025-06-17 13:51:00'),
(10, 'Savings', 2213.67, '2025-04-20 13:51:00');

	SET IDENTITY_INSERT Account OFF;

INSERT INTO SavingsAccount (AccountID, InterestRate) VALUES
(1, 2.65),
(3, 4.95),
(6, 3.50),
(8, 4.70),
(10, 1.45);

INSERT INTO ChequingAccount (AccountID) VALUES
(2),
(4),
(5),
(7),
(9);

	SET IDENTITY_INSERT Overdraft ON;

INSERT INTO Overdraft (OverdraftID, AccountID, OverdraftDate, Amount, CheckNumber) VALUES
(1, 2, '2025-03-21 13:51:00', 385.12, 3),
(2, 4, '2025-02-14 13:51:00', 764.12, 1),
(3, 5, '2025-08-17 13:51:00', 546.93, 2),
(4, 7, '2025-09-21 13:51:00', 1420.64, 1),
(5, 9, '2025-10-08 13:51:00', 221.49, 2);

	SET IDENTITY_INSERT Overdraft OFF;

INSERT INTO CustomerAccount (CustomerID, AccountID) VALUES
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

	SET IDENTITY_INSERT Loan ON;

INSERT INTO Loan (LoanID, BranchID, LoanAmount) VALUES
(1, 5, 1671.89),
(2, 3, 934.78),
(3, 3, 1876.21),
(4, 2, 1250.00),
(5, 1, 3000.00);

	SET IDENTITY_INSERT Loan OFF;

INSERT INTO CustomerLoan (CustomerID, LoanID) VALUES
(1, 2),
(3, 3),
(6, 5),
(7, 4),
(9, 1);

INSERT INTO LoanPayment (LoanID, PaymentNumber, PaymentDate, Amount) VALUES
(1, 2, '2025-08-20 13:51:00', 267.21),
(2, 3, '2025-09-21 13:51:00', 360.50),
(3, 5, '2025-10-12 13:51:00', 678.23),
(4, 4, '2025-08-07 13:51:00', 333.33),
(5, 1, '2025-04-20 13:51:00', 2567.67);