# i_y = "c6b662ecb173c53cc7bb4212057f9c0ba283e000b98c9dcf5feaee7d6c933dfb"
i_d = "b6ace0b14720169839b15fd13326cf1a1829beafc37bb937bec8802fbcf46bd9"
i_n = "ca3586e7ea485f3b0a222a4c79f7dd12e85388eccdee4035940d774c029cf831"
# i_y = '9d29a982563bf87a5814dfc70059a3772cf98a11099f093a2e95d5a874836dd8'
# i_y = '3367c34a35b7c554fe5b78e0cffb91da1cefd42c9bda3e972ceca64c41056f74'
# i_y = '1d6695f1bd5cc1b2e2a0522fb3905edd08dd11d606ac9bcb82b985d0caa1d88f'
# i_y = '5d64c9d9aa7b5f40e3b8fa212f521451423c0f187b45786684c440d910cb3453'
i_y = '3e484ab781113a9527ab3f562caed0b024ee146cf681837765db117de96a6fd1'
def hex2bin(input_string):
    ret = ""
    for char in input_string:
        dec = 0
        if char.isalpha():
            dec = 10 + (ord(char) - ord('a'))
        else:
            dec = ord(char) - ord('0')
        for i in range(4):
            if ((dec >> (3 - i)) & 1) == 1:
                ret = ret + "1"
            else:
                ret = ret + "0"
    return ret
def bin2hex(intput_string):
    ret = ""
    s = intput_string[::-1]
    for i in range(len(s) // 4):
        summation = 0
        for j in range(4):
            summation = summation + (1 << j) * (ord(s[4*i+j]) - 48)
        if summation >= 10:
            ret = ret + chr(97 + summation - 10)
        else:
            ret = ret + chr(48 + summation)
    return ret[::-1]
def binary_addition(a,b):
    carry = 0
    ret = ""
    a = a[::-1]
    b = b[::-1]
    for char_a, char_b in zip(a,b):
        output = (ord(char_a) - 48) + (ord(char_b) - 48) + carry
        if output >= 2:
            carry = 1
            output = output - 2
        else:
            carry = 0
        ret = ret + chr(output + 48)
    if carry == 1:
        print('overflow')
    return ret[::-1]

def binaray_substraction(a,b):
    carry = 0
    ret = ""
    a = a[::-1]
    b = b[::-1]
    for char_a, char_b in zip(a,b):
        output = (ord(char_a) - 48) - (ord(char_b) - 48) + carry
        if output < 0:
            output = output + 2
            carry = -1
        else:
            carry = 0
        ret = ret + chr(output + 48)
    if carry == -1:
        return (True, ret[::-1])
    else:
        return (False, ret[::-1])

def ModuloProduct(N, a, b, k):
    t = '0' + b
    m = '0' * 257
    N = '0' + N
    for i in range(k + 1):
        if a[-1 - i] == '1':
            m_plus_t = binary_addition(m,t)
            mtN = binaray_substraction(m_plus_t, N)
            if mtN[0] == True:
                m = m_plus_t
            else:
                m = mtN[1]
        Ntt = binaray_substraction(N, binary_addition(t, t))
        if Ntt[0] == True:
            t = binaray_substraction(binary_addition(t, t), N)[1]
        else:
            t = binary_addition(t, t)
    return m[1:257]

def Montgomery(N, a, b):
    m = '0' * 258
    b = '00' + b
    N = '00' + N
    for i in range(256):
        if a[-1 - i] == '1':
            m = binary_addition(m, b)
        if m[-1] == '1':
            m = binary_addition(m, N)
        m = '0' + m[0:257]
    if binaray_substraction(m, N)[0] == False:
        m = binaray_substraction(m, N)[1]
    return m[2:258]

def Rsa256Mont(N, y, d):
    t = ModuloProduct(N, '1' + ('0'*256), y, 256) 
    m = '0'*255 + '1'
    for i in range(256):
        if d[-1 - i] == '1':
            m = Montgomery(N, m, t)
        t = Montgomery(N, t, t)
    return m
if __name__ == "__main__":
    y = hex2bin(i_y)
    d = hex2bin(i_d)
    n = hex2bin(i_n)
    
    ans = Rsa256Mont(n, y, d)
    print(bin2hex(ans))
