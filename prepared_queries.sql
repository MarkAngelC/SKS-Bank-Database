--Group K
--Mark Castro
--Derek Carlos
--Jeshua Arias Santos




USE SKSNationalBankDB;
GO

-- this procedure returns the accounts and balances of a given customer
CREATE PROCEDURE CustomerAccounts
    @CustomerID INT
AS
BEGIN
    SELECT C.first_name, C.last_name, A.account_id, AT.type AS account_type, A.balance
    FROM Customer C
    JOIN CustomerAccount CA ON C.customer_id = CA.customer_id
    JOIN Account A ON CA.account_id = A.account_id
    JOIN AccountType AT ON A.account_type_id = AT.account_type_id
    WHERE C.customer_id = @CustomerID;
END;
GO

-- test
EXEC CustomerAccounts @CustomerID = 1;
GO


-- shows total deposits and total loans for a specific branch
CREATE PROCEDURE GetBranchPerformance
    @BranchID VARCHAR(10)
AS
BEGIN
    SELECT branch_id, branch_name, total_deposit, total_loans,
           (total_deposit - total_loans) AS net_balance
    FROM Branch
    WHERE branch_id = @BranchID;
END;
GO

-- test
EXEC GetBranchPerformance @BranchID = 'B001';
GO


-- returns list of employees managed by a given manager
CREATE PROCEDURE GetEmployeesByManager
    @ManagerID INT
AS
BEGIN
    SELECT E.employee_id, E.first_name, E.last_name, E.start_date, B.branch_name
    FROM Employee E
    JOIN Branch B ON E.branch_id = B.branch_id
    WHERE E.manager_id = @ManagerID;
END;
GO

-- test
EXEC GetEmployeesByManager @ManagerID = 1;
GO


-- updates an account balance useful for deposits
CREATE PROCEDURE UpdateAccountBalance
    @AccountID INT,
    @Amount DECIMAL(15,2)
AS
BEGIN
    UPDATE Account
    SET balance = balance + @Amount
    WHERE account_id = @AccountID;
END;
GO

-- test
EXEC UpdateAccountBalance @AccountID = 2, @Amount = 200.00;
GO


-- shows total loan amount and average interest rate per branch
CREATE PROCEDURE GetTotalLoansByBranch
AS
BEGIN
    SELECT 
        B.branch_name,
        SUM(L.amount) AS total_loan_amount,
        AVG(L.interest_rate) AS avg_interest_rate
    FROM Branch B
    JOIN Employee E ON B.branch_id = E.branch_id
    JOIN Account A ON A.account_id IN (
        SELECT account_id FROM Loan
    )
    JOIN Loan L ON A.account_id = L.account_id
    GROUP BY B.branch_name;
END;
GO

-- test
EXEC GetTotalLoansByBranch;
GO



-- shows detailed loan information for each customer
CREATE PROCEDURE GetCustomerLoanDetails
AS
BEGIN
    SELECT 
        C.first_name,
        C.last_name,
        L.loan_id,
        L.amount AS loan_amount,
        L.interest_rate,
        LP.payment_date,
        LP.amount AS last_payment
    FROM Customer C
    JOIN LoanHolder LH ON C.customer_id = LH.customer_id
    JOIN Loan L ON LH.loan_id = L.loan_id
    LEFT JOIN LoanPayment LP ON L.loan_id = LP.loan_id
    ORDER BY C.customer_id, L.loan_id;
END;
GO

-- test
EXEC GetCustomerLoanDetails;
GO



-- lists customers ordered by their total balance
CREATE PROCEDURE GetTopCustomers
    @TopN INT
AS
BEGIN
    SELECT TOP (@TopN)
           C.customer_id, C.first_name, C.last_name, SUM(A.balance) AS total_balance
    FROM Customer C
    JOIN CustomerAccount CA ON C.customer_id = CA.customer_id
    JOIN Account A ON CA.account_id = A.account_id
    GROUP BY C.customer_id, C.first_name, C.last_name
    ORDER BY total_balance DESC;
END;
GO

-- test
EXEC GetTopCustomers @TopN = 5;
GO


-- returns the average balance for a given account type
CREATE FUNCTION GetAverageBalanceByType(@AccountTypeID INT)
RETURNS DECIMAL(15,2)
AS
BEGIN
    DECLARE @AvgBalance DECIMAL(15,2);
    SELECT @AvgBalance = AVG(balance)
    FROM Account
    WHERE account_type_id = @AccountTypeID;
    RETURN @AvgBalance;
END;
GO

-- test
SELECT dbo.GetAverageBalanceByType(1) AS AvgChequingBalance;
GO


-- allows partial matches for easy searching
CREATE PROCEDURE SearchCustomerByLastName
    @LastName NVARCHAR(50)
AS
BEGIN
    SELECT customer_id, first_name, last_name
    FROM Customer
    WHERE last_name LIKE '%' + @LastName + '%';
END;
GO

-- test
EXEC SearchCustomerByLastName @LastName = 'Koelpin';
GO



-- useful for HR to find recent hires
CREATE PROCEDURE GetEmployeesAfterDate
    @StartDate DATE
AS
BEGIN
    SELECT employee_id, first_name, last_name, start_date, branch_id
    FROM Employee
    WHERE start_date > @StartDate
    ORDER BY start_date;
END;
GO

-- test
EXEC GetEmployeesAfterDate @StartDate = '2022-01-01';
GO
