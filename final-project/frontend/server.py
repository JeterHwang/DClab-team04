from flask import Flask, request
from flask import jsonify
# from flask_cors import CORS
# CORS(app)
import time
app = Flask(__name__)
count = 0
# @app.route('/api/hello')
# def index():
#     return "hello"
def writefile(cord):
    f = open("demofile.txt", "w")
    f.write(cord)
    f.close()
@app.route('/api', methods=['POST'])
def postTest():
    if request.method == "POST":
        print(request.json["cord"])
        cord = str(request.json["cord"])
        writefile(cord)
        print("I am a post")
    if not request.json:
        return "not a json post"
    return ({"result": "all good"})

@app.route('/api')
def cor():
    global count
    if count % 10 == 0:
        count = count + 1
        print(count)
        return "[1,4]"
    elif count % 10 == 1:
        count = count + 1
        return "[2,5]"
    elif count % 10 == 2:
        count = count + 1
        print(count)
        return "[3,4]"
    elif count % 10 == 3:
        count = count + 1
        return "[4,5]"
    elif count % 10 == 4:
        count = count + 1
        print(count)
        return "[5,4]"
    elif count % 10 == 5:
        count = count + 1
        return "[12,5]"
    elif count % 10 == 6:
        count = count + 1
        print(count)
        return "[10,4]"
    elif count % 10 == 7:
        count = count + 1
        return "[9,3]"
    elif count % 10 == 8:
        count = count + 1
        print(count)
        return "[14,14]"
    elif count % 10 == 9:
        count = count + 1
        return "[13,12]"
if __name__ == "__main__":
    app.debug = True
    app.run(port=5000)