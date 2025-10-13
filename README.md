**SKS National Bank Database Project**
Project Overview

This project implements a relational database for a fictional bank called SKS National Bank. It includes tables for branches, employees, customers, accounts, loans, and their relationships. The database also contains stored procedures for common operations like transfers and loan payments.

**Group Members**
Mark Angel Castro
Jeshua Arias Santos
Derek Carlos

**The project contains 13 tables:**
Branch
Location
Employee
EmployeeLocation
Customer
CustomerEmployee
Account
SavingsAccount
ChequingOverdraft
AccountHolder
Loan
LoanHolder
LoanPayment


**Files Included**
create_database.sql — SQL script to create the database and all tables.
populate_database.sql — SQL script to insert sample data into all tables.
prepared_queries.sql — Stored procedures for queries, transactions, and reports.

**How to Run**
Open MySQL (or MySQL Workbench).
Execute create_database.sql to create the database and tables.
Execute populate_database.sql to insert sample data.
Execute prepared_queries.sql to create stored procedures.
Use the procedures for testing or querying the database.

**Sample Queries / Procedures**
GetCustomerAccounts(customer_id) — List all accounts of a customer.
TransferBetweenAccounts(from_account, to_account, amount) — Transfer funds safely.
AddLoanPayment(loan_id, payment_number, payment_date, amount) — Add loan payments.

Notes

Branch totals (total_deposits, total_loans) are stored for simplicity.
Employee hierarchy is modeled with manager_id.
Database enforces transactional safety for financial operations.
