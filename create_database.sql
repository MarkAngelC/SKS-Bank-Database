-- Delete the existing database
DROP DATABASE IF EXISTS SKSNationalBankDB;
GO

-- Create new database
CREATE DATABASE SKSNationalBankDB;
GO

USE SKSNationalBankDB;
GO


--Creating Table for SKS Database

-- Address
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50),
    province VARCHAR(50)
);
GO

-- Branch
CREATE TABLE Branch (
    branch_id VARCHAR(10) PRIMARY KEY,
    branch_name VARCHAR(100),
    address_id INT,
    total_deposit DECIMAL(15,2),
    total_loans DECIMAL(15,2),

    CONSTRAINT FK_Branch_Address
    FOREIGN KEY (address_id)
    REFERENCES Address(address_id)
);
GO

-- Employee
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    start_date DATE,
    manager_id INT NULL,
    branch_id VARCHAR(10),

    CONSTRAINT FK_Employee_Manager
    FOREIGN KEY (manager_id)
    REFERENCES Employee(employee_id),

    CONSTRAINT FK_Employee_Branch
    FOREIGN KEY (branch_id)
    REFERENCES Branch(branch_id)
);
GO

-- AccountType
CREATE TABLE AccountType (
    account_type_id INT PRIMARY KEY,
    type VARCHAR(50)
);
GO

-- Account
CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    account_type_id INT,
    balance DECIMAL(15,2),
    open_date DATE,

    CONSTRAINT FK_Account_AccountType
    FOREIGN KEY (account_type_id)
    REFERENCES AccountType(account_type_id)
);
GO

-- Customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address_id INT,

    CONSTRAINT FK_Customer_Address
    FOREIGN KEY (address_id)
    REFERENCES Address(address_id)
);
GO

-- CustomerAccount 
CREATE TABLE CustomerAccount (
    customer_id INT,
    account_id INT,
    PRIMARY KEY (customer_id, account_id),

    CONSTRAINT FK_CustomerAccount_Customer
    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id),

    CONSTRAINT FK_CustomerAccount_Account
    FOREIGN KEY (account_id)
    REFERENCES Account(account_id)
);
GO

-- SavingsAccount
CREATE TABLE SavingsAccount (
    account_id INT PRIMARY KEY,
    interest_rate DECIMAL(5,2),

    CONSTRAINT FK_SavingsAccount_Account
    FOREIGN KEY (account_id)
    REFERENCES Account(account_id)
);
GO

-- ChequingAccount
CREATE TABLE ChequingAccount (
    account_id INT PRIMARY KEY,
    overdraft_limit DECIMAL(10,2),

    CONSTRAINT FK_ChequingAccount_Account
    FOREIGN KEY (account_id)
    REFERENCES Account(account_id)
);
GO

-- Loan
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    account_id INT,

    CONSTRAINT FK_Loan_Account
    FOREIGN KEY (account_id)
    REFERENCES Account(account_id)
);
GO

-- LoanPayment
CREATE TABLE LoanPayment (
    loan_id INT,
    payment_date DATE,
    amount DECIMAL(15,2),
    PRIMARY KEY (loan_id, payment_date),

    CONSTRAINT FK_LoanPayment_Loan
    FOREIGN KEY (loan_id)
    REFERENCES Loan(loan_id)
);
GO

-- LoanHolder 
CREATE TABLE LoanHolder (
    loan_id INT,
    customer_id INT,
    PRIMARY KEY (loan_id, customer_id),

    CONSTRAINT FK_LoanHolder_Loan
    FOREIGN KEY (loan_id)
    REFERENCES Loan(loan_id),

    CONSTRAINT FK_LoanHolder_Customer
    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id)
);
GO

-- CustomerEmployee 
CREATE TABLE CustomerEmployee (
    customer_id INT,
    employee_id INT,
    PRIMARY KEY (customer_id, employee_id),

    CONSTRAINT FK_CustomerEmployee_Customer
    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id),

    CONSTRAINT FK_CustomerEmployee_Employee
    FOREIGN KEY (employee_id)
    REFERENCES Employee(employee_id)
);
GO

-- EmployeeAddress 
CREATE TABLE EmployeeAddress (
    employee_id INT,
    address_id INT,
    PRIMARY KEY (employee_id, address_id),

    CONSTRAINT FK_EmployeeAddress_Employee
    FOREIGN KEY (employee_id)
    REFERENCES Employee(employee_id),

    CONSTRAINT FK_EmployeeAddress_Address
    FOREIGN KEY (address_id)
    REFERENCES Address(address_id)
);
GO
