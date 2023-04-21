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

  describe "Test Complete" do
    test "Check complete ys" do
      b = complete_bottom(20, [{{19, 19}, {19, 19, :red}}])
      assert complete_ys(b) == [20]
    end

    test "Collapse single row" do
      b = complete_bottom(20, [{{19, 19}, {19, 19, :red}}])
      actual = Map.keys(collapse_row(b, 20))
      refute {19, 19} in actual
      assert {19, 20} in actual
      assert Enum.count(actual) == 1
    end

    test "Full Collapse with single row" do
      b = complete_bottom(20, [{{19, 19}, {19, 19, :red}}])
      {actual_count, actual_bottom} = full_collapse(b)

      assert actual_count == 1
      assert {19, 20} in Map.keys(actual_bottom)
    end

    defp complete_bottom(complete_row, xtras) do
      (xtras ++
         (1..10
          |> Enum.map(fn x ->
            {{x, complete_row}, {x, complete_row, :red}}
          end)))
      |> Map.new()
    end
  end

  defp bottom do
    %{{1, 1} => {1, 1, :blue}}
  end
end
