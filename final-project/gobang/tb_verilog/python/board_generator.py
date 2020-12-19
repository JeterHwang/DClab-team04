from os import path
import numpy as np
import os

from numpy.core.fromnumeric import put

w, h = 15, 15
Matrix = [[2 for x in range(w)] for y in range(h)]
board = np.array(Matrix)
    
def put_chess(x, y, role):
    board[x][y] = role

def write_out(path2file): 
    if os.path.exists(path2file) == False: 
        print('path does not exists !!')
        return
    with open(path2file, 'w') as out_file:
        for i in range(w):
            for j in range(h):
                out_file.write(str(board[i][j]))
                out_file.write(' ')
            out_file.write('\n')

if __name__ == "__main__":
    while True:
        print('what operation do you prefer ? (input / write)')
        s = input()
        if s == 'write':
            write_out('/Users/peterlin/DClab-team04/final-project/gobang/pattern/PG_test1_i.txt')
            # read_in('C:\\Users\\Jeter Hwang\\OneDrive\\桌面\\Github\\ICS\\DClab-team04\\final-project\\gobang\\pattern\\PG_test1_i.txt')
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
            put_chess(number_string[0], number_string[1], number_string[2])
        else:
            print('no operation type matched !!')

        