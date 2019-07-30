class Formatter
  attr_reader :records

  def initialize(records)
    @records = records
  end

  def format
    lines.prepend(header).join("\n") << "\n"
  end

  private

  def sorted_records
    records.sort_by{|record|
      [-record.won, -record.drawn, record.name]
    }
  end

  def lines
    sorted_records.map{|record|
      values = %i(name matches_played won drawn lost points).map{|field|
        record.send(field)
      }
      line(*values)
    }
  end

  def line(*fields)
    "%-30s | %2s | %2s | %2s | %2s | %2s" % fields
  end

  def header
    line('Team', 'MP', 'W', 'D', 'L', 'P')
  end
end
