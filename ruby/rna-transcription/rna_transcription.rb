class Complement

  DNA_RNA_MAP =  {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(seq)
    seq.scan(/\w/).map{ |nuc|
      DNA_RNA_MAP[nuc]
    }.join
  end

end
