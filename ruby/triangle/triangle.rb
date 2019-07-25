class Triangle

  attr_accessor :sides

  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    return false if illegal?
    sides.uniq.count == 1
  end

  def isosceles?
    return false if illegal?
    sides.uniq.count <= 2
  end

  def scalene?
    return false if illegal?
    sides.uniq.count == 3
  end

  private

  def illegal?
    return true if sides.any? {|side| side == 0}

    sides.each_with_index {|side, i|
      other_sides = sides.dup
      other_sides.delete_at(i)
      return true if side > other_sides.sum
    }

    false
  end

end
