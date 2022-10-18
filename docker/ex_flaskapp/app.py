import os
from flask import Flask

app = Flask(__name__)

bg_color = os.environ.get('BG_COLOR')
flask_host = os.environ.get('FLASK_RUN_HOST')
flask_port = os.environ.get('FLASK_RUN_PORT')


@app.route("/")
def main():
    print(bg_color)
    return render_template('hello.html', color=bg_color)


if __name__ == "__main__":
    app.run(host=flask_host, port=flask_port)