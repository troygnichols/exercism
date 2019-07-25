class Hamming

  def self.compute(a, b)
    raise ArgumentError unless a.length == b.length
    a.each_char.with_index.count { |ch, idx| b[idx] != ch }
  end
end
