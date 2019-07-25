class Transpose
  class Matrix
    attr_reader :matrix

    def initialize(matrix)
      @matrix = matrix
    end

    def format
      matrix.map(&:join).map(&:rstrip).join("\n")
    end

    def width
      @width ||= (matrix.map(&:count).max || 0)
    end

    def height
      @height ||= matrix.length
    end

    def transpose
      Matrix.new(
        (0...width).map {|n|
          (0...height).map {|m|
            matrix[m][n] || "\s"
          }
        }
      )
    end
  end

  class << self
    def transpose(str)
      Matrix.new(parse(str))
        .transpose
        .format
    end

    def parse(str)
      str.lines(chomp: true).map(&:chars)
    end
  end
end
