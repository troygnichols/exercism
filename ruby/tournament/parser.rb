require_relative 'team_record'

class Parser
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def parse
    input
      .strip
      .lines(chomp: true)
      .each_with_object(build_cache){ |line, cache|
        home, away, result = line.split(';')
        record_result(result, cache[home], cache[away])
    }.values
  end

  def self.parse(input)
    new(input).parse
  end

  private

  def build_cache
    Hash.new {|cache, team| cache[team] = TeamRecord.new(team)}
  end

  def record_result(result, home, away)
    case result
    when "win"
      record_win(home, away)
    when "loss"
      record_win(away, home)
    when "draw"
      record_draw(home, away)
    else
      raise ArgumentError,
        "Unknown result: '#{result}'"
    end
  end

  def record_win(home, away)
    home.win!
    away.lose!
  end

  def record_draw(*teams)
    teams.each(&:draw!)
  end
end
