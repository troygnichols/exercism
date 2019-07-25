defmodule RNATranscription do

  @dna_rna_map %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U,
  }

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(fn c -> @dna_rna_map[c] end)
  end
end
