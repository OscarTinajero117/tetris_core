defmodule TetrisCoreTest do
  use ExUnit.Case
  doctest TetrisCore

  test "greets the world" do
    assert TetrisCore.hello() == :world
  end
end
