"""
    Simple Flask Application for testing Git CI/CD 
"""
from flask import Flask


app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World!"


if __name__ == '__main__':
    """
        Use for Port Declaration and python run
    """
    app.debug = True
    app.run()
