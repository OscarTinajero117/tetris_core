defmodule Tetris.Brick do

  defstruct [
    name: :i,
    location: {40, 0},
    rotation: 0,
    reflection: false
  ]

  def new_random() do
    %{
      name: random_name(),
      location: {40, 0},
      rotation: random_rotation(),
      reflection: random_reflection()
      }
  end

  def name_list(), do: ~w(i l z o t)a

  def reflection_list(), do: [true, false]

  def rotation_list(), do: [0, 90, 180, 270]

  defp random_name() do
    name_list()
      |> Enum.random
  end

  defp random_reflection() do
    reflection_list()
      |> Enum.random
  end

  defp random_rotation() do
    rotation_list()
      |> Enum.random
  end

  def up(brick) do
    nil
  end

  def down(brick) do
    nil
  end

  def left(brick) do
    nil
  end

  def right(brick) do
    nil
  end
end
