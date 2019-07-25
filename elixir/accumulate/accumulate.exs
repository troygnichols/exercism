defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    do_acc(list, fun)
  end

  defp do_acc(_list, _fun, acc \\ [])
  defp do_acc([], _fun, acc), do: acc
  defp do_acc([h|list], fun, acc) do
    do_acc(list, fun, acc ++ [fun.(h)])
  end
end
