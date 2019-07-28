class Formatter
  attr_reader :store

  def initialize(store)
    @store = store
  end

  def format
    lines.prepend(header).join("\n") << "\n"
  end

  def sort(data)
    data.sort_by{|record|
      won, drawn, team = record.fetch_values(:won, :drawn, :team)
      [-won, -drawn, team]
    }
  end

  def header
    line('Team', 'MP', 'W', 'D', 'L', 'P')
  end

  def lines
    sort(store.data).map{|record|
      line(
        *record.fetch_values(
          :team, :matches_played, :won, :drawn, :lost, :points))
    }
  end

  def line(*fields)
    "%-30s | %2s | %2s | %2s | %2s | %2s" % fields
  end
end
