from flask import Flask, request
import time
app = Flask(__name__)

# @app.route('/api/hello')
# def index():
#     return "hello"
@app.route('/api')
def cor():
    # if time.localtime().tm_sec % 2 == 0:
    #     return [1,4]
    # else:
    return "[2,5]"
@app.route('/api', methods=['POST'])
def cord():
    # if time.localtime().tm_sec % 2 == 0:
    #     return [1,4]
    # else:
    return "[2,5]"
if __name__ == "__main__":
    app.debug = True
    app.run(port=5000)