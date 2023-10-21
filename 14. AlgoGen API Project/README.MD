# Project Report


## Task Description :
Create an API that takes data from the user and store it into a database.

<br>

### Python Code :

- I've used Flask here to take data from an HTML form. I've tried to use JSON but couldn't finish the code. Then I've found Flask has an **request** object that can be used to get data from a form.

- Then I tried to connect the Flask app to SQL Server. I couldn't get it done. One of my friend from varsity helped me use **pyodbc** to connect the app to a database. For some reasons, it just wouldn't connect. We tried almost everything. Nothing worked in the end.

<br>

### SQL Code :

- You can use a SQL trigger for the last two columns **(diff & diff%)** that was given to me. If the table has data inserted into the first three columns, it will automatically populate the last two columns using the trigger. 

- I couldn't connect my database to the API but wrote the SQL trigger code anyway. I've tried inserting data into the table manually and it seems to work great.
