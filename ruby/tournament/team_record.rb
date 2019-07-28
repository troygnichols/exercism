class TeamRecord
  FIELDS = %i(matches_played won drawn lost points)

  attr_reader(*FIELDS)

  def initialize
    FIELDS.each{|field| instance_variable_set("@#{field}", 0) }
  end

  def win!
    match!
    @points += 3
    @won += 1
  end

  def lose!
    match!
    @lost += 1
  end

  def draw!
    match!
    @drawn += 1
    @points += 1
  end

  def to_h
    FIELDS.inject({}) {|memo, field|
      memo.merge(field => send(field))
    }
  end

  private

  def match!
    @matches_played += 1
  end
end

