class Matrix(object):
    def __init__(self, matrix_string):
        lines = matrix_string.split("\n")
        self.rows = list(map(
            lambda line: list(map(int, line.split())),
            lines))

    def row(self, index):
        return self.rows[index-1]

    def column(self, index):
        return list(map(lambda row: row[index-1], self.rows))
