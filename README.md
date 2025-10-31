# SKS National Bank Database Project

## Overview

This project is a SQL Server database for **SKS National Bank**.
It includes scripts to create, populate, and query the database using stored procedures and one function.

---

## Files

* **create_database.sql** – Creates the database, tables, and relationships.
* **populate_database.sql** – Inserts sample data into each table.
* **prepared_queries.sql** – Contains all stored procedures and the user-defined function.

---

## Stored Procedures and Function

1. **GetCustomerAccounts** – Shows all accounts and balances for a specific customer.
2. **GetBranchPerformance** – Displays total deposits, loans, and net balance for a branch.
3. **GetEmployeesByManager** – Lists employees under a specific manager.
4. **UpdateAccountBalance** – Updates an account balance (for deposits or withdrawals).
5. **AddCustomerAccount** – Adds a link between a customer and an account.
6. **GetCustomerCountPerBranch** – Counts customers for each branch.
7. **GetTopCustomers** – Lists top customers by total balance.
8. **GetAverageBalanceByType** *(Function)* – Returns the average balance for a given account type.
9. **SearchCustomerByLastName** – Finds customers by partial last name.
10. **GetEmployeesAfterDate** – Displays employees hired after a specific date.

---

## How to Run

1. Open **SQL Server Management Studio (SSMS)**.
2. Run the scripts in order:

   1. `create_database.sql`
   2. `populate_database.sql`
   3. `prepared_queries.sql`
3. Each procedure includes a test command (using `EXEC` or `SELECT`) to verify its functionality.

---

# Contributors

Mark Angel Castro
Jeshua Arias Santos
Derek Carlos
