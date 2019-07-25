defmodule Bob do
  def hey(input) do
    cond do
      blank?(input) -> "Fine. Be that way!"
      yelling?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp blank?(input), do: input |> String.trim |> String.length == 0

  defp yelling?(input), do: has_letters?(input) && upcase?(input)

  defp question?(input), do: String.ends_with?(input, "?")

  defp has_letters?(input), do: String.upcase(input) != String.downcase(input)

  defp upcase?(input), do: String.upcase(input) == input
end
