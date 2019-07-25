defmodule RotationalCipher do

  @ascii_uppercase_min 65
  @ascii_lowercase_min 97
  @ascii_lowercase_max 122
  @alphabet_size 26

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.codepoints
    |> Enum.reduce(<<>>, fn (<<c>>, acc) ->
      acc <> <<transpose_char(c, shift)>>
    end)
  end

  defp transpose_char(c, _) when c < @ascii_uppercase_min, do: c
  defp transpose_char(c, _) when c > @ascii_lowercase_max, do: c
  defp transpose_char(c, shift) when c < @ascii_lowercase_min do
    calc(c, shift, @ascii_uppercase_min)
  end
  defp transpose_char(c, shift) do
    calc(c, shift, @ascii_lowercase_min)
  end

  defp calc(char, shift, offset) do
    ((char - offset + shift)
    |> rem(@alphabet_size)) + offset
  end
end
