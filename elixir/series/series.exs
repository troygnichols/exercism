defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())

  def slices(string, size) do
    string
    |> String.graphemes
    |> do_slices(size)
  end

  def do_slices(_chars, _size, _acc \\ [])

  def do_slices(chars, size, acc)
  when size <= 0 or length(chars) < size, do: acc

  def do_slices(chars = [_|next], size, acc) do
    part = chars |> Enum.take(size) |> Enum.join
    do_slices(next, size, acc ++ [part])
  end
end
