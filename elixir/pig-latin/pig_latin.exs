defmodule PigLatin do

  @regex ~r/([^aeiouy]*qu[^aeiouy]*|y(?!t)|x(?!r)|[^aeiouyx]*)([aeiouyx]\w*)/

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase |> String.split |> Enum.map(&translate_word/1) |> Enum.join(" ")
  end

  defp translate_word(word) do
    Regex.replace(@regex, word, "\\2\\1ay")
  end

end
