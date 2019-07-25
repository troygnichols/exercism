class Acronym

  def self.abbreviate(txt='')
    txt.scan(/\b\w/).join.upcase
  end

end
