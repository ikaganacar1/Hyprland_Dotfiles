from flask import Flask,render_template

app = Flask(__name__)

@app.route('/')
def page():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(port=7064, debug=True)