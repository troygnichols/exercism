defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> split_sentence
    |> normalize_case
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end

  defp split_sentence(sentence) do
    Regex.scan(~r/[[:alnum:]'-]+/u, sentence)
    |> Enum.map(fn [word] -> word end)
  end

  defp normalize_case(words),
    do: Enum.map(words, &String.downcase/1)
end
