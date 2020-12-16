from serial import Serial, EIGHTBITS, PARITY_NONE, STOPBITS_ONE
from sys import argv

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

key = fp_key.read(64)
enc = fp_enc.read()
assert len(enc) % 32 == 0
a = 0xf5
s.write(a)
b = s.read(8)
print("a", a ,"b:",b)
