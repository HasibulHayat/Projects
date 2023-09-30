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

I've used these three types of indexing here.

**1. Primary Index :** transaction_id as a PRIMARY KEY, which automatically creates a unique clustered index on that column. This is usually sufficient for queries that filter or sort based on transaction_id.

**2. Non-Clustered Indexes :** For frequently querying transactions for specific accounts, transaction_types, date ranges consider adding non-clustered index on the account_id, transaction_type and transaction_date.

**3. Composite Index :** For frequently querying multiple columns, consider a composite index. For example, if you often need to find transactions for a specific account within a date range, a composite index on account_id and transaction_date is useful.

### Partitioning :

Utilizing both indexing and partitioning can offer a powerful combination for optimizing query performance and managing large datasets. But I couldn't finish the partitioning code.

### Views :

If the queries of the report have to be generated regularly or you have to perform complex joins or aggregations, encapsulating them in a view is a good idea. So, I've put all the queries in a views.

### Stored Procedure :

You can also combine stored procedures and views for faster reporting. But the code is gonna be too complex to understand and debug. So, I didn't go ahead with the process.

### Optimized Queries :

I've tried to write queries that are efficient and optimized.

### Denormalization :

Denormalization improves the performance of certain types of queries. Data Warehouse stores the data from Transaction Tables using this technique. It's great for faster queries. Since I've used only one table this technique isn't needed here.

<br>

## Reporting with python :

PyCharm Professional Edition has plugins to connect a variety fo databases directly but PyCharm Community Edition, which is the free version uses libraries to do this. I have thought of using ***pyodbc*** to connect my SQL Server database to PyCharm. Since, no libraries or modules can't be used so I've manually input the query results and made a report from them. 

<br>

## Report :

<img src = "https://github.com/HasibulHayat/Projects/blob/main/13.%20Algorithm%20Generation%20Project/Images/1.png">
<img src = "https://github.com/HasibulHayat/Projects/blob/main/13.%20Algorithm%20Generation%20Project/Images/2.png">
