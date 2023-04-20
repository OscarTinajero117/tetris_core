defmodule BottomTest do
  use ExUnit.Case

  import Tetris.Bottom

  describe "Test Collisions" do
    test "Accepted Collision" do
      assert collides?(bottom(), {1, 1})
    end

    test "Fail Collision" do
      refute collides?(bottom(), {1, 2})
    end

    test "Accepted Collision (Same color)" do
      assert collides?(bottom(), {1, 1, :blue})
    end

    test "Accepted Collision (Diferent color)" do
      assert collides?(bottom(), {1, 1, :red})
    end

    test "Fail Collision (With Diferent color)" do
      refute collides?(bottom(), {1, 2, :red})
    end

    test "Accepted Collision (points in list)" do
      assert collides?(bottom(), [{1, 2, :red}, {1, 1, :blue}])
    end

    test "Fail Collision (diferent points in list)" do
      refute collides?(bottom(), [{1, 2, :red}, {1, 3, :blue}])
    end
  end

  describe "Test Merges" do
    test "Merge" do
      assert merge(bottom(), [{1, 2, :red}]) == %{{1, 1} => {1, 1, :blue}, {1, 2} => {1, 2, :red}}
    end

    test "Merge (with collision)" do
      assert merge(bottom(), [{1, 1, :red}]) == %{{1, 1} => {1, 1, :red}}
    end
  end

  defp bottom do
    %{{1, 1} => {1, 1, :blue}}
  end
end
