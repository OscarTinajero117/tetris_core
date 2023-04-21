defmodule TetrisTest do
  use ExUnit.Case

  import Tetris
  alias Tetris.{Brick}
  
  describe "Get out of size" do
    test "Try to move right, success" do
      brick = Brick.debug_brick(location: {5, 1})
      bottom = %{}

      expected = brick |> Brick.right
      actual = try_right(brick, bottom)

      assert expected == actual
    end
    
    test "Try to move right, failure (returns origianl brick)" do
      brick = Brick.debug_brick(location: {8, 1})
      bottom = %{}

      actual = try_right(brick, bottom)

      assert actual == brick
    end

    test "Drops without merging" do
      brick = Brick.debug_brick(location: {5, 5})
      bottom = %{}

      expected = %{
        brick: brick |> Brick.down,
        bottom: bottom,
        score: 1
      }
      actual = drop(brick, bottom, :red)

      assert expected == actual
    end

    test "Drops and merges" do
      brick = Brick.debug_brick(location: {5, 16})
      bottom = %{}

      actual = drop(brick, bottom, :red)

      assert Map.get(actual.bottom, {7, 20}) == {7, 20, :red}
    end
  end
end
