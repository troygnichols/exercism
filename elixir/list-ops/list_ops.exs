defmodule ListOps do
  @spec count(list) :: non_neg_integer
  def count(list), do: do_count(list, 0)

  defp do_count([], acc), do: acc
  defp do_count([_ | t], acc), do: do_count(t, acc + 1)

  @spec reverse(list) :: list
  def reverse(list), do: do_reverse(list, [])

  defp do_reverse([], acc), do: acc
  defp do_reverse([h | t], acc), do: do_reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(list, fun), do: do_map(list, fun, []) |> reverse()

  defp do_map([], _fun, acc), do: acc
  defp do_map([h | t], fun, acc), do: do_map(t, fun, [fun.(h) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, fun), do: do_filter(list, fun, []) |> reverse()

  defp do_filter([], _fun, acc), do: acc
  defp do_filter([h | t], fun, acc) do
    case fun.(h) do
      true -> do_filter(t, fun, [h | acc])
      _ -> do_filter(t, fun, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _fun), do: acc
  def reduce([h | t], acc, fun), do: reduce(t, fun.(h, acc), fun)

  @spec append(list, list) :: list
  def append(a, b), do: do_append(reverse(a), b)

  defp do_append([], b), do: b
  defp do_append([h | t], b), do: do_append(t, [h | b])

  @spec concat([[any]]) :: [any]
  def concat(list) do
    list |> reverse() |> reduce([], &append(&1, &2))
  end
end
