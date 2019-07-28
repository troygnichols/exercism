class DataStore
  attr_reader :store

  def initialize
    @store = Hash.new{|store, team| store[team] = TeamRecord.new}
  end

  def record_win(home, away)
    store[home].win!
    store[away].lose!
  end

  def record_loss(home, away)
    record_win(away, home)
  end

  def record_draw(*teams)
    teams.each{|team| store[team].draw!}
  end

  def data
    store.map{|team, data|
      data.to_h.merge(team: team)
    }
  end
end
