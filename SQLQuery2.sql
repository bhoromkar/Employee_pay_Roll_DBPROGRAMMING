BEGIN TRANSACTION;

    -- Step 1: Insert a new customer into the "Customers" table
    INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
    VALUES ('C001', 'Amit', 'Mohanty', 'amit.mohanty@example.com');

    -- Step 2: Insert a new order for the customer into the "Orders" table
    INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
    VALUES ('O001', 'C001', '2023-07-21', 100.00);

COMMIT TRANSACTION;


-- Example table creation
CREATE TABLE BankAccount (
    AccountID INT PRIMARY KEY,
    Balance DECIMAL(10, 2)
);

-- Sample data
INSERT INTO BankAccount (AccountID, Balance) VALUES (1, 1000.00);

-- Begin a transaction
BEGIN TRANSACTION;

-- Perform some operations within the transaction
UPDATE BankAccount SET Balance = Balance - 500.00 WHERE AccountID = 1;
INSERT INTO BankAccount (AccountID, Balance) VALUES (2, 500.00);

-- Check the balance of AccountID 1 within the transaction
SELECT Balance FROM BankAccount WHERE AccountID = 1; -- This will show 500.00

-- Commit the transaction
COMMIT TRANSACTION;

-- Check the balance of AccountID 1 after committing
SELECT Balance FROM BankAccount WHERE AccountID = 1; -- This will show 500.00

-- Check the balance of AccountID 2 after committing
SELECT Balance FROM BankAccount WHERE AccountID = 2; -- This will show 500.00
