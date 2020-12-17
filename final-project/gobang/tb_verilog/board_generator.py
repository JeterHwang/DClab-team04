import numpy as np

w, h = 15, 15
Matrix = [[0 for x in range(w)] for y in range(h)]
board = np.array(Matrix)
    
def put_chess(x, y, role):
    board[x][y] = role
def write_out():
    with open('PG_test1_i.txt', 'w') as out_file:
        print(out_file)
        out_file.write("1234567")
    print('finish !!')
if __name__ == "__main__":
    while True:
        print('what operation do you prefer ? (input / write)')
        s = input()
        if s == 'write':
            write_out()
            break
        elif s == 'input':
            print('Where do you want to put ?')
            print('eg. x  / y  / role')
            s = input()
            number_string = s.split(' ')
            number_string = [int(i) for i in number_string]
            if len(number_string) != 3 :
                print('input format not valid !!')
                continue
        else:
            print('no operation type matched !!')

        