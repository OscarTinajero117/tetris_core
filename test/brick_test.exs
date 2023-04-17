defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick

  doctest TetrisCore

  describe "Creates a random brick" do
    test "Check a random name brick" do
      assert new_random().name in name_list()
    end

    test "Check a rotation brick" do
      assert new_random().rotation in rotation_list()
    end

    test "Check a reflection brick" do
      assert new_random().reflection in reflection_list()
    end

  end

  describe "Move brick" do

    test "Move brick down" do
      brick = new_random()
      {x, y} = brick.location
      assert down(brick).location == {x, y + 1}
    end

    test "Move brick left" do
      brick = new_random()
      {x, y} = brick.location
      assert left(brick).location == {x - 1, y}
    end

    test "Move brick right" do
      brick = new_random()
      {x, y} = brick.location
      assert right(brick).location == {x + 1, y}
    end

    test "Rotate brick 90˚" do
      brick = new_random()

      rotation = brick.rotation

      case rotation do
        270 -> assert spin_90(brick).rotation == 0
        _ -> assert spin_90(brick).rotation == rotation + 90
      end

    end
  end

end
