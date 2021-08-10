from flask import Flask

app = Flask(__name__)

@app.route("/test")
def test():
    with open('logFiles/HelloWorld.txt','a') as file:
        file. write("Hello world from app1\n")
    return "<p>Test successfull</p>"

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

if __name__== '__main__':
    app.run(host='localhost',port=5000)
