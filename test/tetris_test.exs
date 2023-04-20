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
  end
end
