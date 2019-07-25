class Anagram
  attr_reader :word, :sorted_chars

  def initialize(word)
    @word = word.downcase
    @sorted_chars = @word.chars.sort
  end

  def match(candidates)
    candidates.filter { |c| anagram?(c) }
  end

  def anagram?(candidate)
    c = candidate.downcase
    sorted_chars == c.chars.sort unless word == c
  end
end
