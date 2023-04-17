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

end
