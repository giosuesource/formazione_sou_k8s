from flask import Flask

app = Flask(__name__)

# Routes
@app.route('/')
def index():
    return “Hello world!”

if __name__ == ‘DevOps':
   app.run(debug=True)
