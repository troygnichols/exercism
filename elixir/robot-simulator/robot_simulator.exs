defmodule RobotSimulator do
  @directions [:north, :east, :south, :west]

  defmodule Robot do
    defstruct [:dir, :pos]
  end

  defguard is_dir(dir) when dir in @directions

  defguard is_pos(x, y) when is_integer(x) and is_integer(y);

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(dir \\ :north, pos \\ {0, 0})

  def create(dir, {x, y}) when is_dir(dir) and is_pos(x, y),
    do: %Robot{dir: dir, pos: {x, y}}

  def create(dir, _pos) when is_dir(dir), do: {:error, "invalid position"}

  def create(_dir, _pos), do: {:error, "invalid direction"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, ""), do: robot

  def simulate(robot, "A" <> next) do
    %Robot{robot | pos: advance(robot)}
    |> simulate(next)
  end

  def simulate(robot, "L" <> next) do
    %Robot{robot | dir: rotate(robot, -1)}
    |> simulate(next)
  end

  def simulate(robot, "R" <> next) do
    %Robot{robot | dir: rotate(robot, +1)}
    |> simulate(next)
  end

  def simulate(_, _), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%Robot{dir: d}), do: d

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%Robot{pos: p}), do: p

  defp advance(%Robot{ dir: :north, pos: {x,y} }), do: {x,   y+1}
  defp advance(%Robot{ dir: :east,  pos: {x,y} }), do: {x+1, y}
  defp advance(%Robot{ dir: :south, pos: {x,y} }), do: {x,   y-1}
  defp advance(%Robot{ dir: :west,  pos: {x,y} }), do: {x-1, y}

  defp rotate(%Robot{dir: dir}, clicks) do
    curr_idx = Enum.find_index(@directions, &(&1 == dir))
    next_idx = curr_idx + clicks |> rem(length(@directions))
    Enum.fetch!(@directions, next_idx)
  end
end
