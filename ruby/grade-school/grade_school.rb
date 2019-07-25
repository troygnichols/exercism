require 'set'

class School
  attr_reader :roster

  def initialize
    @roster = Hash.new {|roster, grade|
      roster[grade] = SortedSet.new
    }
  end

  def students(grade)
    roster[grade].to_a
  end

  def students_by_grade
    roster.keys.sort.map {|grade|
      {grade: grade, students: students(grade)}
    }
  end

  def add(name, grade)
    roster[grade] << name
  end
end
