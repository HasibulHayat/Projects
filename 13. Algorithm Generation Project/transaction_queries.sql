-- Analyzing and Creating Views


-- select * from table
SELECT * FROM transactions


-- Total Amount of 'Credit' and 'Debit' Transactions
SELECT     transaction_type, SUM(amount) AS total_amount
FROM       transactions
GROUP BY   transaction_type;


-- Net Balance for Each Account
SELECT     account_id,
           SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE 0 END) -
           SUM(CASE WHEN transaction_type = 'Debit' THEN amount ELSE 0 END) AS net_balance
FROM       transactions
GROUP BY   account_id;


-- Transactions per Day
SELECT     CAST(transaction_date AS DATE) AS 'Date', COUNT(*) AS num_transactions
FROM       transactions
GROUP BY   transaction_date
ORDER BY   transaction_date;


-- Total Amount of Transaction per Day
SELECT	   CAST(transaction_date AS DATE) AS 'Date', SUM(amount) AS total_amount
FROM       transactions
GROUP BY   transaction_date
ORDER BY   transaction_date;


-- Creating Views

CREATE VIEW  v_TotalAmountByTransactionType AS
SELECT       transaction_type, SUM(amount) AS total_amount
FROM         transactions
GROUP BY     transaction_type;

CREATE VIEW  v_NetBalancePerAccount AS
SELECT       account_id,
             SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE 0 END) -
             SUM(CASE WHEN transaction_type = 'Debit' THEN amount ELSE 0 END) AS net_balance
FROM         transactions
GROUP BY     account_id;

CREATE VIEW  v_TransactionsPerDay AS
SELECT       CAST(transaction_date AS DATE) AS 'Date', COUNT(*) AS num_transactions
FROM         transactions
GROUP BY     transaction_date;

CREATE VIEW  v_TotalAmountPerDay AS
SELECT       CAST(transaction_date AS DATE) AS 'Date', SUM(amount) AS total_amount
FROM         transactions
GROUP BY     transaction_date;


-- selecting data from views

SELECT * FROM v_TotalAmountByTransactionType;

SELECT * FROM v_NetBalancePerAccount;

SELECT TOP 3 * FROM v_TransactionsPerDay;

SELECT TOP 3 * FROM v_TotalAmountPerDay ORDER BY 2 DESC;