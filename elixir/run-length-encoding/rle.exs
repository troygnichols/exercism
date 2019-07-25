defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes
    |> Enum.chunk_while([],
      fn ch, acc ->
        IO.puts "acc: #{inspect acc}"
        case acc do
          [] ->
            IO.puts "BEGIN ch: #{ch}"
            {:cont, [ch|acc]}
          [^ch|_] ->
            IO.puts "ACCUM ch: #{ch}}"
            {:cont, [ch|acc]}
          _ ->
            IO.puts "EMIT ch: #{ch}, acc: #{inspect acc}"
            {:cont, ch, acc}
        end
      end,
      fn
        [] ->
          IO.puts "return []"
          {:cont, []}
        acc ->
          IO.puts "return: #{inspect acc}"
          {:cont, acc, []}
      end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
  end
end
