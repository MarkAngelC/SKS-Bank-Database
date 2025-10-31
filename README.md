# SKS National Bank Database Project

## Overview

This project is a SQL Server database for **SKS National Bank**.
It includes scripts to create the database, populate it with sample data, and run stored procedures and one function for various banking operations.

---

## Files

* **create_database.sql** – Creates all tables, relationships, and constraints.
* **populate_database.sql** – Inserts sample data for all tables.
* **prepared_queries.sql** – Contains 12 stored procedures and 1 function for testing and reporting.

---

## Database Tables

Main tables include:

* `Address`
* `Branch`
* `Employee`
* `Customer`
* `AccountType`
* `Account`
* `CustomerAccount`
* `SavingsAccount`
* `ChequingAccount`
* `Loan`
* `LoanPayment`
* `LoanHolder`
* `CustomerEmployee`
* `EmployeeAddress`

---

## Stored Procedures and Function

1. **GetCustomerAccounts** – Shows all accounts and balances for a customer.
2. **GetBranchPerformance** – Displays total deposits, loans, and net balance for a branch.
3. **GetEmployeesByManager** – Lists employees under a specific manager.
4. **UpdateAccountBalance** – Updates account balance (for deposits or withdrawals).
5. **AddCustomerAccount** – Links a customer with a new account.
6. **GetCustomerCountPerBranch** – Counts customers per branch.
7. **GetTopCustomers** – Lists top customers by total balance.
8. **GetAverageBalanceByType** *(Function)* – Returns average balance by account type.
9. **SearchCustomerByLastName** – Finds customers by last name (partial match).
10. **GetEmployeesAfterDate** – Lists employees hired after a certain date.
11. **GetTotalLoansByBranch** – Shows total loan amount and average interest rate per branch.
12. **GetCustomerLoanDetails** – Displays each customer’s loan, amount, rate, and last payment info.

---

## How to Run

1. Open **SQL Server Management Studio (SSMS)**.
2. Run the scripts in this order:

   1. `create_database.sql`
   2. `populate_database.sql`
   3. `prepared_queries.sql`
3. Use the `EXEC` or `SELECT` test commands to verify each stored procedure or function.

---

## Group Members

* **Mark Castro**
* **Derek Carlos**
* **Jeshua Arias Santos**
