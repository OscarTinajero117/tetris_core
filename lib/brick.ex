defmodule Tetris.Brick do
  alias Tetris.Points

  @moduledoc """
  # Documentation for `Tetris.Brick`.
  """
  @x_center 40
  defstruct name: :i,
            location: {40, 0},
            rotation: 0,
            reflection: false

  def debug_brick(attrs \\ []), do: __struct__(attrs)

  @doc """
  ## Tetris.Brick.new_random.

  Creates a random brick

  ## Examples

      iex> Tetris.Brick.new_random()
      %{
        location: {40, 0},
        name: :i,
        reflection: true,
        rotation: 90
      }
  """
  def new_random() do
    %__MODULE__{
      name: random_name(),
      location: {3, -3},
      rotation: random_rotation(),
      reflection: random_reflection()
    }
  end

  @doc """
  ## Tetris.Brick.name_list.

  Creates the list of names

  ## Examples

      iex> Tetris.Brick.name_list()
      [:i, :l, :z, :o, :t]
  """
  def name_list(), do: ~w(i l z o t)a

  @doc """
  ## Tetris.Brick.reflection_list.

  Creates the list of reflections

  ## Examples

      iex> Tetris.Brick.reflection_list()
      [true, false]
  """
  def reflection_list(), do: [true, false]

  @doc """
  ## Tetris.Brick.rotation_list.

  Creates the list of rotations

  ## Examples

      iex> Tetris.Brick.rotation_list()
      [0, 90, 180, 270]
  """
  def rotation_list(), do: [0, 90, 180, 270]

  # def up(brick) do
  # TODO: Move brick to final position
  # end

  def x_center(), do: @x_center

  def down(brick), do: %{brick | location: point_down(brick.location)}

  def left(brick), do: %{brick | location: point_left(brick.location)}

  def right(brick), do: %{brick | location: point_right(brick.location)}

  def spin_90(brick), do: %{brick | rotation: rotate(brick.rotation)}

  def shape(%{name: :l}) do
    [
      {2, 1},
      {2, 2},
      {2, 3},
      {3, 3}
    ]
  end

  def shape(%{name: :i}) do
    [
      {2, 1},
      {2, 2},
      {2, 3},
      {2, 4}
    ]
  end

  def shape(%{name: :o}) do
    [
      {2, 2},
      {3, 2},
      {2, 3},
      {3, 3}
    ]
  end

  def shape(%{name: :z}) do
    [
      {2, 2},
      {2, 3},
      {3, 3},
      {3, 4}
    ]
  end

  def shape(%{name: :t}) do
    [
      {2, 1},
      {2, 2},
      {3, 2},
      {2, 3}
    ]
  end

  def color(%{name: :i}), do: :blue
  def color(%{name: :l}), do: :green
  def color(%{name: :z}), do: :grey
  def color(%{name: :o}), do: :orange
  def color(%{name: :t}), do: :red

  def prepare(brick) do
    brick
    |> shape()
    |> Points.rotate(brick.rotation)
    |> Points.mirror(brick.reflection)
  end

  def to_string(brick) do
    brick
    |> prepare()
    |> Points.to_string()
  end

  def print(brick) do
    brick
    |> prepare()
    |> Points.print()

    brick
  end

  defp rotate(270), do: 0
  defp rotate(degrees), do: degrees + 90

  defp point_down({x, y}), do: {x, y + 1}

  defp point_left({x, y}), do: {x - 1, y}

  defp point_right({x, y}), do: {x + 1, y}

  defp random_name() do
    name_list()
    |> Enum.random()
  end

  defp random_reflection() do
    reflection_list()
    |> Enum.random()
  end

  defp random_rotation() do
    rotation_list()
    |> Enum.random()
  end

  defimpl Inspect, for: Tetris.Brick do
    import Inspect.Algebra

    def inspect(brick, _opts) do
      concat([
        Tetris.Brick.to_string(brick),
        "\n",
        inspect(brick.location),
        " ",
        inspect(brick.reflection),
        " ",
        inspect(brick.rotation)
      ])
    end
  end
end
