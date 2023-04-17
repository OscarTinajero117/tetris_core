defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick

  doctest TetrisCore

  # test "Creates a new brick" do
  #   assert new_brick().name == :i
  # end

  describe "Creates a random brick" do
    test "Check a random name brick" do
      assert new_random().name in ~w(i l z o t)a
    end

    test "Check a rotation brick" do
      assert new_random().rotation in [0, 90, 180, 270]
    end

    test "Check a reflection brick" do
      assert new_random().reflection in [true, false]
    end

  end


  # def new_brick, do: new()
end
