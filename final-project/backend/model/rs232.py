#!/usr/bin/env python
from serial import Serial, EIGHTBITS, PARITY_NONE, STOPBITS_ONE
from sys import argv
from flask import Flask, request
from flask import jsonify
import time

app = Flask(__name__)

assert len(argv) == 2
s = Serial(
    port=argv[1],
    baudrate=115200,
    bytesize=EIGHTBITS,
    parity=PARITY_NONE,
    stopbits=STOPBITS_ONE,
    xonxoff=False,
    rtscts=False
)
def int_to_coordinate(number):
    tmp_string = str(number[2:])
    while(len(tmp_string) <8):
        tmp_string = '0'+tmp_string
    x = int(tmp_string[0])*8+int(tmp_string[1])*4+int(tmp_string[2])*2+int(tmp_string[3])
    y = int(tmp_string[4])*8+int(tmp_string[5])*4+int(tmp_string[6])*2+int(tmp_string[7])
    return (x,y)
@app.route('/api', methods=['POST'])
def postCord():
    if request.method == "POST":
        print(request.json["cord"])
        cord = str(request.json["cord"])
        print(cord)
        s.write(int(cord).to_bytes(1,'little'))
        print("I am a post")
    if not request.json:
        return "not a json post"
    return ({"result": "all good"})

@app.route('/api')
def getCord():
    b = s.read(1)
    whiteCord = int_to_coordinate(bin(b[0]))
    print(int_to_coordinate(bin(b[0])))
    return str([str(whiteCord[0]), str(whiteCord[1])])
if __name__ == "__main__":
    app.debug = True
    app.run(port=5000)

# for i in range(10):
#     a = i
#     s.write(int(a).to_bytes(1,'little'))
#     b= s.read(1)
#     print(int_to_coordinate(bin(b[0])))
# while(True):
#     a = input("enter a number:")
#     if(int(a) == 255):
#         break
    
    
#     print("your turn")
# print("The game is over!!!")
# def writefile(cord):
#     f = open("demofile.txt", "w")
#     f.write(cord)
#     f.close()
