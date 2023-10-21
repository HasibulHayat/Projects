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
