class TeamRecord
  attr_reader :name, :won, :lost, :drawn

  def initialize(name)
    @name = name
    @won, @drawn, @lost = 0, 0, 0
  end

  def win!
    @won += 1
  end

  def lose!
    @lost += 1
  end

  def draw!
    @drawn += 1
  end

  def matches_played
    won + lost + drawn
  end

  def points
    won * 3 + drawn
  end
end

