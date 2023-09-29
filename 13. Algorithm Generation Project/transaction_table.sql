-- Algorithm Generation Project


-- Creating transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY IDENTITY(1, 1),
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('Debit', 'Credit')),
    amount DECIMAL(20, 5),
    transaction_date DATETIME,
    created_at DATETIME DEFAULT GETDATE()
)


-- Creating non-clustered index on account_id
CREATE NONCLUSTERED INDEX idx_transactions_account_id
ON transactions(account_id);

-- Creating non-clustered index on transaction_type
CREATE NONCLUSTERED INDEX idx_transactions_transaction_type
ON transactions(transaction_type);

-- Creating non-clustered index on transaction_date
CREATE NONCLUSTERED INDEX idx_transactions_transaction_date
ON transactions(transaction_date);

-- Creating composite non-clustered index on account_id and transaction_date
CREATE NONCLUSTERED INDEX idx_transactions_account_date
ON transactions(account_id, transaction_date);


-- Change the data type of the amount column
ALTER TABLE dbo.transactions
ALTER COLUMN amount DECIMAL(15, 2);


-- Populating the table
INSERT INTO transactions (account_id, transaction_type, amount, transaction_date)
VALUES
(101, 'Credit', 100, '2023-01-01'),
(101, 'Debit', 50, '2023-01-02'),
(102, 'Credit', 200, '2023-01-01'),
(102, 'Debit', 20, '2023-01-02'),
(103, 'Credit', 300, '2023-01-03'),
(103, 'Debit', 100, '2023-01-04'),
(104, 'Credit', 500, '2023-01-05'),
(104, 'Debit', 200, '2023-01-06'),
(105, 'Credit', 400.50, '2023-01-07'),
(105, 'Debit', 100.50, '2023-01-08'),
(106, 'Credit', 300, '2023-01-09'),
(106, 'Debit', 50, '2023-01-10'),
(107, 'Credit', 600, '2023-01-11'),
(107, 'Debit', 100.50, '2023-01-12'),
(108, 'Credit', 700.50, '2023-01-13'),
(108, 'Debit', 100, '2023-01-14'),
(109, 'Credit', 800, '2023-01-15'),
(109, 'Debit', 100, '2023-01-16'),
(110, 'Credit', 900, '2023-01-17'),
(110, 'Debit', 100, '2023-01-18');


-- select * from the table 
SELECT * FROM transactions;
