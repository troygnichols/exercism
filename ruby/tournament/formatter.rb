class Formatter

  FIELDS = %i(name matches_played won drawn lost points)

  LINE_TEMPLATE = "%-30s | %2s | %2s | %2s | %2s | %2s"

  HEADER_FIELDS = ['Team', 'MP', 'W', 'D', 'L', 'P']

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
      [-record.points, record.name]
    }
  end

  def lines
    sorted_records.map{|record|
      values = FIELDS.map{|field|
        record.send(field)
      }
      line(values)
    }
  end

  def line(fields)
    LINE_TEMPLATE % fields
  end

  def header
    line(HEADER_FIELDS)
  end
end
