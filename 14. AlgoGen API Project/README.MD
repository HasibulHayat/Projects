# Project Report


## Task Description :
Create an API that takes data from the user and store it into a database.

<br>

### Python Code :

- I've used Flask here to take data from an HTML form. I've tried to use JSON but couldn't finish the code. Then I've found Flask has an **request** object that can be used to get data from a form. Here is the code :

<br>

```
from flask import Flask, request

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def get_data():
    if request.method == 'POST':
        heads = str(request.form.get('heads'))
        number_static = int(request.form.get('number_static'))
        live = int(request.form.get('live'))

        return f"Received Data : {heads} , {number_static} , {live}"

    return '''
        <form method="post">
            Heads : <input type="text" name="heads"><br>
            Number Static : <input type="number" name="number_static"><br>
            Live : <input type="number" name="live"><br>
            <br>
            <input type="submit" value="Submit">
        </form>
    '''


if __name__ == '__main__':
    app.run()
```

<br>

- Then I tried to connect the Flask app to SQL Server. I couldn't get it done. One of my friend from varsity helped me use **pyodbc** to connect the app to a database. For some reasons, it just wouldn't connect. We tried almost everything. Nothing worked in the end. Here is code with **pyodbc** :

<br>

```
from flask import Flask, request
import pyodbc

app = Flask(__name__)

con_data = (
    "Driver={SQL Server};"
    "Server=localhost;"
    "Database=interview;"
    "Trusted_Connection=yes"
)
con = pyodbc.connect(con_data)
cursor = con.cursor()


@app.route('/', methods=['GET', 'POST'])
def get_data():
    if request.method == 'POST':
        heads = str(request.form.get('heads'))
        number_static = int(request.form.get('number_static'))
        live = int(request.form.get('live'))

        cursor.execute("INSERT INTO api_data_table (heads, number_static, live) VALUES (?, ?, ?)", heads, number_static, live)
        con.commit()

        return f"Received Data : {heads} , {number_static} , {live}"

    return '''
        <form method="post">
            Heads : <input type="text" name="heads"><br>
            Number Static : <input type="number" name="number_static"><br>
            Live : <input type="number" name="live"><br>
            <br>
            <input type="submit" value="Submit">
        </form>
    '''


if __name__ == '__main__':
    app.run()
```

<br>

### SQL Code :

- You can use a SQL trigger for the last two columns **(diff & diff%)** that was given to me. If the table has data inserted into the first three columns, it will automatically populate the last two columns using the trigger. 

- I couldn't connect my database to the API but wrote the SQL trigger code anyway. I've tried inserting data into the table manually and it seems to work great.
