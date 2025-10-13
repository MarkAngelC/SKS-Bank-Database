CREATE DATABASE SKS_NationalBank;
GO
USE SKS_NationalBank;

CREATE TABLE Branch (
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName VARCHAR(100) UNIQUE NOT NULL,
    City VARCHAR(100) NOT NULL,
    TotalDeposits DECIMAL(15,2) DEFAULT 0,
    TotalLoans DECIMAL(15,2) DEFAULT 0
);

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    HomeAddress VARCHAR(200),
    StartDate DATE NOT NULL,
    ManagerID INT NULL,
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);


-- Location Table
CREATE TABLE Location (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(100),
    IsBranch BIT DEFAULT 1
);

-- EmployeeLocation (many-to-many)
CREATE TABLE EmployeeLocation (
    EmployeeID INT,
    LocationID INT,
    PRIMARY KEY (EmployeeID, LocationID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    HomeAddress VARCHAR(200)
);

-- Account Table (parent table)
CREATE TABLE Account (
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    AccountType VARCHAR(50) CHECK (AccountType IN ('Chequing', 'Savings')),
    Balance DECIMAL(15,2) DEFAULT 0,
    LastAccessed DATE
);

-- Savings Account (specialized)
CREATE TABLE SavingsAccount (
    AccountID INT PRIMARY KEY,
    InterestRate DECIMAL(5,2),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Chequing Account (specialized)
CREATE TABLE ChequingAccount (
    AccountID INT PRIMARY KEY,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Overdrafts (for Chequing)
CREATE TABLE Overdraft (
    OverdraftID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT NOT NULL,
    OverdraftDate DATE,
    Amount DECIMAL(15,2),
    CheckNumber INT,
    FOREIGN KEY (AccountID) REFERENCES ChequingAccount(AccountID)
);

-- CustomerAccount (many-to-many)
CREATE TABLE CustomerAccount (
    CustomerID INT,
    AccountID INT,
    PRIMARY KEY (CustomerID, AccountID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Loan Table
CREATE TABLE Loan (
    LoanID INT IDENTITY(1,1) PRIMARY KEY,
    BranchID INT,
    LoanAmount DECIMAL(15,2),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- CustomerLoan (many-to-many)
CREATE TABLE CustomerLoan (
    CustomerID INT,
    LoanID INT,
    PRIMARY KEY (CustomerID, LoanID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);

-- Loan Payment
CREATE TABLE LoanPayment (
    LoanID INT,
    PaymentNumber INT,
    PaymentDate DATE,
    Amount DECIMAL(15,2),
    PRIMARY KEY (LoanID, PaymentNumber),
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);