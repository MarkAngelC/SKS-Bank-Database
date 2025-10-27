SKS National Bank Database Project

 Project Overview

This project implements a **relational database** for a fictional financial institution — **SKS National Bank**.
The system models the core structure and operations of a real-world bank, including data for branches, employees, customers, accounts, and loans.

The database is fully normalized and includes stored procedures for key operations such as **fund transfers**, **loan payments**, and **account queries**.

---
 Group Members

* **Mark Angel Castro**
* **Jeshua Arias Santos**
* **Derek Carlos**

---
 Database Design Summary

The database design is based on the approved **Entity Relationship Diagram (ERD)** for SKS National Bank.
It includes **13 core tables** representing entities and relationships between them.

 **Main Tables**

1. **Branch** – Stores branch details, address, total deposits, and loans.
2. **Location** – Represents physical or non-branch locations.
3. **Employee** – Contains employee information, including start date, manager, and assigned branch.
4. **EmployeeLocation** – Junction table linking employees and locations (M:N).
5. **Customer** – Represents bank clients.
6. **CustomerEmployee** – Junction table linking customers to their assigned employees (M:N).
7. **Account** – Base table for both savings and chequing accounts.
8. **SavingsAccount** – Subtype of Account, includes `InterestRate`.
9. **ChequingOverdraft** – Subtype of Account, includes `OverdraftLimit`.
10. **AccountHolder** – Junction table linking customers and accounts (M:N).
11. **Loan** – Represents loans issued by the bank.
12. **LoanHolder** – Junction table linking customers and loans (M:N).
13. **LoanPayment** – Tracks payments made toward each loan.

---


## ✅ Conclusion

The SKS National Bank Database provides a normalized, relational structure suitable for managing banking data and operations.
It supports scalability, integrity, and real-world functionality aligned with the requirements of the case study.

**Database System:** MySQL

**Prepared by:**
*Group K – BVC Technology Group*

