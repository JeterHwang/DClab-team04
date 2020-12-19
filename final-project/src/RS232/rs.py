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

a = 0x64     #0110_0100
a.to_bytes(1,byteorder = 'little')
s.write(a)
b = s.read(1)
print("a", a ,"b:",b)
