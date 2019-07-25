defmodule Roman do

  @map [
    {1000, "M"},
    {900,  "CM"},
    {500,  "D"},
    {400,  "CD"},
    {100,  "C"},
    {90,   "XC"},
    {50,   "L"},
    {40,   "XL"},
    {10,   "X"},
    {9,    "IX"},
    {5,    "V"},
    {4,    "IV"},
    {1,    "I"},
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()

  def numerals(number, map \\ @map, acc \\ "")

  def numerals(_, [], acc), do: acc

  def numerals(number, [{divisor, symbol}|t], acc) do
    current = div(number, divisor)
    next = rem(number, divisor)
    numerals(next, t, acc <> symbolize(current, symbol))
  end

  defp symbolize(n, sym) do
    for _ <- (1..n), n > 0, into: "", do: sym
  end

end
