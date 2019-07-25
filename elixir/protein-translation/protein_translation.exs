defmodule ProteinTranslation do

  @protein_map %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> split_rna
    |> read_strand
  end

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case @protein_map |> Map.get(codon) do
      nil -> {:error, "invalid codon"}
      res -> {:ok, res}
    end
  end

  defp split_rna(rna) do
    Regex.scan(~r/\w{3}/, rna)
    |> Enum.map(fn [p] -> p end)
  end

  defp read_strand(codons, acc \\ [])
  defp read_strand([], acc), do: {:ok, acc}
  defp read_strand([h|codons], acc) do
    case of_codon(h) do
      {:ok, "STOP"} -> {:ok, acc}
      {:ok, res} -> read_strand(codons, acc ++ [res])
      _ ->
        {:error, "invalid RNA"}
    end
  end
end
