from flask import Flask
import requests

app = Flask(__name__)

@app.route("/")
def hello_world():
    print('aqui')
    return "<p>Hello, World!</p>"
@app.route("/hello")
def test():
    with open('logFiles/HelloWorld.txt','a') as file:
        file. write("Hello world from app2\n")
    return requests.get('http://172.17.0.2:5001/test').text

if __name__== '__main__':
    app.run(host='localhost',port=5002)
