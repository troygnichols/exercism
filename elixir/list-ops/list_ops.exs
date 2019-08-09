defmodule ListOps do
  @spec count(list) :: non_neg_integer
  def count(list) do
    reduce(list, 0, fn (_, acc) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(list) do
    reduce(list, [], fn (item, acc) ->  [item | acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(list, fun) do
    reduce(list, [], fn (item, acc) -> [fun.(item) | acc] end)
    |> reverse()
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, fun) do
    reduce(list, [], fn (item, acc) ->
      case !!fun.(item) do
        true -> [item | acc]
        _ -> acc
      end
    end)
    |> reverse()
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _fun), do: acc
  def reduce([h | t], acc, fun), do: reduce(t, fun.(h, acc), fun)

  @spec append(list, list) :: list
  def append(a, b), do: a |> reverse() |> do_append(b)

  defp do_append([], b), do: b
  defp do_append([h | t], b), do: do_append(t, [h | b])

  @spec concat([[any]]) :: [any]
  def concat(list) do
    list |> reverse() |> reduce([], &append(&1, &2))
  end
end
