-- Group K
-- Mark Castro
-- Derek Carlos
-- Jeshua Arias Santos

-- Reset database
DROP DATABASE IF EXISTS SKSNationalBankDB;
GO
CREATE DATABASE SKSNationalBankDB;
GO
USE SKSNationalBankDB;
GO

/* ----------------------- ADDRESS ----------------------- */
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50),
    province VARCHAR(50)
);
GO

/* ----------------------- BRANCH ----------------------- */
CREATE TABLE Branch (
    branch_id VARCHAR(10) PRIMARY KEY,
    branch_name VARCHAR(100),
    address_id INT,
    total_deposit DECIMAL(15,2),
    total_loans DECIMAL(15,2),

    CONSTRAINT FK_Branch_Address
        FOREIGN KEY (address_id) REFERENCES Address(address_id)
);
GO

/* ----------------------- BANK OFFICE ----------------------- */
CREATE TABLE BankOffice (
    office_id INT PRIMARY KEY,
    office_name VARCHAR(100),
    address_id INT UNIQUE, 

    CONSTRAINT FK_BankOffice_Address
        FOREIGN KEY (address_id) REFERENCES Address(address_id)
);
GO

/* ----------------------- EMPLOYEE ROLE ----------------------- */
CREATE TABLE EmployeeRole (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50)
);
GO

/* ----------------------- EMPLOYEE ----------------------- */
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    start_date DATE,
    manager_id INT NULL,
    branch_id VARCHAR(10),
    office_id INT,
    address_id INT,
    role_id INT,

    CONSTRAINT FK_Employee_Manager
        FOREIGN KEY (manager_id) REFERENCES Employee(employee_id),

    CONSTRAINT FK_Employee_Branch
        FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),

    CONSTRAINT FK_Employee_Office
        FOREIGN KEY (office_id) REFERENCES BankOffice(office_id),

    CONSTRAINT FK_Employee_Address
        FOREIGN KEY (address_id) REFERENCES Address(address_id),

    CONSTRAINT FK_Employee_Role
        FOREIGN KEY (role_id) REFERENCES EmployeeRole(role_id)
);
GO

/* ----------------------- CUSTOMER ----------------------- */
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    employee_id INT,
    address_id INT,

    CONSTRAINT FK_Customer_Employee
        FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),

    CONSTRAINT FK_Customer_Address
        FOREIGN KEY (address_id) REFERENCES Address(address_id)
);
GO

/* ----------------------- ACCOUNT TYPE ----------------------- */
CREATE TABLE AccountType (
    account_type_id INT PRIMARY KEY,
    type VARCHAR(50)
);
GO

/* ----------------------- ACCOUNT ----------------------- */
CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    account_type_id INT,
    balance DECIMAL(15,2),
    open_date DATE,

    CONSTRAINT FK_Account_AccountType
        FOREIGN KEY (account_type_id) REFERENCES AccountType(account_type_id)
);
GO

/* ----------------------- CUSTOMER - ACCOUNT  ----------------------- */
CREATE TABLE CustomerAccount (
    customer_id INT,
    account_id INT,
    PRIMARY KEY (customer_id, account_id),

    CONSTRAINT FK_CustomerAccount_Customer
        FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),

    CONSTRAINT FK_CustomerAccount_Account
        FOREIGN KEY (account_id) REFERENCES Account(account_id)
);
GO

/* ----------------------- SAVINGS ACCOUNT ----------------------- */
CREATE TABLE SavingsAccount (
    account_id INT PRIMARY KEY,
    interest_rate DECIMAL(5,2),

    CONSTRAINT FK_SavingsAccount_Account
        FOREIGN KEY (account_id) REFERENCES Account(account_id)
);
GO

/* ----------------------- CHEQUING ACCOUNT ----------------------- */
CREATE TABLE ChequingAccount (
    account_id INT PRIMARY KEY,
    overdraft_limit DECIMAL(10,2),

    CONSTRAINT FK_ChequingAccount_Account
        FOREIGN KEY (account_id) REFERENCES Account(account_id)
);
GO

/* ----------------------- OVERDRAFT  ----------------------- */
CREATE TABLE OverDraft (
    account_id INT PRIMARY KEY,   
    overdraft_date DATE,
    amount INT,
    check_number INT,

    CONSTRAINT FK_OverDraft_Chequing
        FOREIGN KEY (account_id) REFERENCES ChequingAccount(account_id)
);
GO

/* ----------------------- LOAN ----------------------- */
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    end_date DATE
);
GO

/* ----------------------- LOAN PAYMENT  ----------------------- */
CREATE TABLE LoanPayment (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_number INT,
    payment_date DATE,
    amount DECIMAL(15,2),

    CONSTRAINT FK_LoanPayment_Loan
        FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);
GO

/* ----------------------- LOAN HOLDER  ----------------------- */
CREATE TABLE LoanHolder (
    loan_id INT,
    customer_id INT,
    PRIMARY KEY (loan_id, customer_id),

    CONSTRAINT FK_LoanHolder_Loan
        FOREIGN KEY (loan_id) REFERENCES Loan(loan_id),

    CONSTRAINT FK_LoanHolder_Customer
        FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
GO
