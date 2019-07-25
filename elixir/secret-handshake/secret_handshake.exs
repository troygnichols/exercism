defmodule SecretHandshake do
  use Bitwise

  @actions [
    {0b1000, "jump"},
    {0b100,  "close your eyes"},
    {0b10,   "double blink"},
    {0b1,    "wink"},
  ]

  @reverse_key 0b10000

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    for {key, action} <- @actions, bits_set?(code, key), reduce: [] do
      acc -> [action|acc]
    end
    |> maybe_reverse(code)
  end

  defp maybe_reverse(list, code) do
    cond do
      bits_set?(code, @reverse_key) -> Enum.reverse(list)
      true -> list
    end
  end

  defp bits_set?(code, key), do: (code &&& key) >= key
end
