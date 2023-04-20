defmodule PointsTest do
  use ExUnit.Case

  import Tetris.Points

  doctest Tetris

  describe "Check Translate and Rotation" do
    test "Should flip, rotate and mirror" do
      [{1, 1}]
      |> mirror
      |> assert_points({4, 1})
      |> flip
      |> assert_points({4, 4})
      |> rotate(90)
      |> assert_points({1, 4})
      |> rotate_90
      |> assert_points({1, 1})
    end

    defp assert_points([points], expected) do
      assert points == expected
      [points]
    end
  end
end
