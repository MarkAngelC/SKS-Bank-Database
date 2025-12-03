USE SKSNationalBankDB;
GO

CREATE TABLE Audit (
	audid_id INT PRIMARY KEY IDENTITY(1,1),
	description VARCHAR(255),
	date_created DATETIME);
GO


--this trigger activates after an insert is done on the Loan Table meaning that a new loan is made.
	--example output - New loan (id 1) has been created.
CREATE TRIGGER newLoan
ON Loan
AFTER INSERT
AS
BEGIN
	INSERT INTO Audit (description, date_created)
	SELECT ('New loan (id ' + convert(varchar(255),loan_id) + ') has been created. '), GETDATE()
	FROM inserted 
END;

--test 1
INSERT INTO Loan (loan_id, amount, interest_rate, start_date, end_date, account_id) VALUES
(6, 2000, 2.5, GETDATE(), '12-31-2025', 3);

SELECT * FROM Audit;

--test 2
INSERT INTO Loan (loan_id, amount, interest_rate, start_date, end_date, account_id) VALUES
(7, 9800, 3.5, GETDATE(), '12-31-2025', 10);

SELECT * FROM Audit;


--this trigger activates after a row is deleted in the Account table meaning that an account was deleted.
	--example output - Account id 1 has been deleted.
CREATE TRIGGER accountDeletion
ON Account
AFTER DELETE
AS
BEGIN
	INSERT INTO Audit (description, date_created)
	SELECT ('Account id ' + convert(varchar(255), account_id) + ' has been deleted.'), GETDATE()
	FROM deleted;
END;

--test 1
INSERT INTO Account (account_id, account_type_id, balance, open_date) VALUES
(11, 2, 1000.00, GETDATE());

DELETE FROM Account WHERE account_id = 11;

SELECT * FROM Audit;

--test 2
INSERT INTO Account (account_id, account_type_id, balance, open_date) VALUES
(12, 2, 100.00, GETDATE());

DELETE FROM Account WHERE account_id = 12;

SELECT * FROM Audit;


--this trigger activates after a row is deleted in the Account table meaning that an account was deleted.
	--example output - Account id 1 balance has been updated. New balance: 2000.00
CREATE TRIGGER accountBalanceUpdated
ON Account
AFTER UPDATE
AS
BEGIN
	INSERT INTO Audit (description, date_created)
	SELECT ('Account id ' + convert(varchar(255), account_id) + ' balance has been updated. New balance: ' + convert(varchar(255), balance)), GETDATE()
	FROM inserted
END;

--test 1
UPDATE Account 
	SET balance = 600.00
	WHERE account_id = 5;

SELECT * FROM Audit;

--test 2
UPDATE Account 
	SET balance = 300.00
	WHERE account_id = 8;

SELECT * FROM Audit;
