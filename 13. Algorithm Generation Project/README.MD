# Project Report


## Task Description :
How will you design a transaction table for accounting software to generate faster reporting returns? 
One has to generate a report from this table using raw Python without using any library or framework. 
There is no specific design for your reference. You can apply any design pattern you wish.

<br>

## Database Design

**To design a table called transaction, the following columns will be included :**

1. transaction_id (Primary Key)
2. account_id (Foreign Key)
3. transaction_type (Credit/Debit)
4. amount
5. transaction_date
6. created_at

<br>

**To speed up reporting & optimize transaction table,
the following techniques are considered :**

### Indexing :

**1. Primary Index :** transaction_id as a PRIMARY KEY, which automatically creates a unique clustered index on that column. This is usually sufficient for queries that filter or sort based on transaction_id.

**2. Non-Clustered Indexes :** For frequently querying transactions for specific accounts, transaction_types, date ranges consider adding non-clustered index on the account_id, transaction_type and transaction_date.

**3. Composite Index :** For frequently querying multiple columns, consider a composite index. For example, if you often need to find transactions for a specific account within a date range, a composite index on account_id and transaction_date is useful.
