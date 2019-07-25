class Isogram

  def self.isogram?(input)
    input.downcase.scan(/\w/).then {|letters|
      letters.count == letters.uniq.count
    }
  end
end
