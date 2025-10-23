
--  DATABASE: SKS_NationalBank

DROP DATABASE IF EXISTS SKS_NationalBank;
GO

CREATE DATABASE SKS_NationalBank;
GO
USE SKS_NationalBank;
GO


-- ADDRESS

CREATE TABLE Address (
    Address_ID INT IDENTITY(1,1) PRIMARY KEY,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Province VARCHAR(100) NOT NULL
);


-- BRANCH

CREATE TABLE Branch (
    Branch_ID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Address_ID INT NOT NULL,
    TotalDeposit DECIMAL(15,2) DEFAULT 0,
    TotalLoans DECIMAL(15,2) DEFAULT 0,

    CONSTRAINT fk_Branch_Address
        FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);


-- EMPLOYEE

CREATE TABLE Employee (
    Employee_ID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    Manager_ID INT NULL,
    Branch_ID INT NOT NULL,

    CONSTRAINT fk_Employee_Manager
        FOREIGN KEY (Manager_ID) REFERENCES Employee(Employee_ID),

    CONSTRAINT fk_Employee_Branch
        FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);


-- EMPLOYEEADDRESS

CREATE TABLE EmployeeAddress (
    Employee_ID INT NOT NULL,
    Address_ID INT NOT NULL,

    CONSTRAINT pk_EmployeeAddress
        PRIMARY KEY (Employee_ID, Address_ID),

    CONSTRAINT fk_EmployeeAddress_Employee
        FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),

    CONSTRAINT fk_EmployeeAddress_Address
        FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);


-- CUSTOMER

CREATE TABLE Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL
);


-- CUSTOMERADDRESS (M:N)

CREATE TABLE CustomerAddress (
    Customer_ID INT NOT NULL,
    Address_ID INT NOT NULL,

    CONSTRAINT pk_CustomerAddress
        PRIMARY KEY (Customer_ID, Address_ID),

    CONSTRAINT fk_CustomerAddress_Customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),

    CONSTRAINT fk_CustomerAddress_Address
        FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);


-- ACCOUNT

CREATE TABLE Account (
    Account_ID INT IDENTITY(1,1) PRIMARY KEY,
    AccountType VARCHAR(50) NOT NULL
        CONSTRAINT chk_AccountType CHECK (AccountType IN ('Savings', 'Chequing')),
    Balance DECIMAL(15,2) DEFAULT 0,
    OpenDate DATE NOT NULL,
    Customer_ID INT NULL,

    CONSTRAINT fk_Account_Customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


-- ACCOUNTHOLDER 

CREATE TABLE AccountHolder (
    Account_ID INT NOT NULL,
    Customer_ID INT NOT NULL,

    CONSTRAINT pk_AccountHolder
        PRIMARY KEY (Account_ID, Customer_ID),

    CONSTRAINT fk_AccountHolder_Account
        FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID),

    CONSTRAINT fk_AccountHolder_Customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


-- SAVINGS ACCOUNT 

CREATE TABLE SavingsAccount (
    Account_ID INT PRIMARY KEY,
    InterestRate DECIMAL(5,2) NOT NULL
        CONSTRAINT chk_InterestRate CHECK (InterestRate >= 0),

    CONSTRAINT fk_SavingsAccount_Account
        FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);


-- CHEQUING OVERDRAFT 

CREATE TABLE ChequingOverdraft (
    Account_ID INT PRIMARY KEY,
    OverdraftLimit DECIMAL(15,2) NOT NULL
        CONSTRAINT chk_OverdraftLimit CHECK (OverdraftLimit >= 0),

    CONSTRAINT fk_ChequingOverdraft_Account
        FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);


-- LOAN

CREATE TABLE Loan (
    Loan_ID INT IDENTITY(1,1) PRIMARY KEY,
    LoanType VARCHAR(50) NOT NULL,
    Amount DECIMAL(15,2) NOT NULL
        CONSTRAINT chk_LoanAmount CHECK (Amount > 0),
    InterestRate DECIMAL(5,2) NOT NULL
        CONSTRAINT chk_LoanInterest CHECK (InterestRate >= 0),
    StartDate DATE NOT NULL,
    EndDate DATE NULL
);


-- LOANHOLDER 

CREATE TABLE LoanHolder (
    Loan_ID INT NOT NULL,
    Customer_ID INT NOT NULL,

    CONSTRAINT pk_LoanHolder
        PRIMARY KEY (Loan_ID, Customer_ID),

    CONSTRAINT fk_LoanHolder_Loan
        FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID),

    CONSTRAINT fk_LoanHolder_Customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


-- LOANPAYMENT

CREATE TABLE LoanPayment (
    Loan_ID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(15,2) NOT NULL
        CONSTRAINT chk_PaymentAmount CHECK (Amount > 0),

    CONSTRAINT pk_LoanPayment
        PRIMARY KEY (Loan_ID, PaymentDate),

    CONSTRAINT fk_LoanPayment_Loan
        FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
);


-- CUSTOMEREMPLOYEE

CREATE TABLE CustomerEmployee (
    Customer_ID INT NOT NULL,
    Employee_ID INT NOT NULL,

    CONSTRAINT pk_CustomerEmployee
        PRIMARY KEY (Customer_ID, Employee_ID),

    CONSTRAINT fk_CustomerEmployee_Customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),

    CONSTRAINT fk_CustomerEmployee_Employee
        FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
