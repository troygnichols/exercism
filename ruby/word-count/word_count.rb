class Phrase
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def word_count
    word
      .downcase
      .scan(/\b\w+'?\w*\b/)
      .group_by(&:itself).transform_values(&:count)
  end
end
