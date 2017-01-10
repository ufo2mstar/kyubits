def zig_zag(matrix):
    row = 0
    col = 0

    direction = 1
    while col < len(matrix[0]):
        while 0 <= row < len(matrix):
            print matrix[row][col],
            row += direction

        row -= direction

        direction = -1*direction
        col += 1

m = [[1,2,3],[4,5,6],[7,8,9]]
zig_zag(m)