defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  test "part1" do
    input = [
      [%{x: 0, y: 9}, %{x: 5, y: 9}],
      [%{x: 8, y: 0}, %{x: 0, y: 8}],
      [%{x: 9, y: 4}, %{x: 3, y: 4}],
      [%{x: 2, y: 2}, %{x: 2, y: 1}],
      [%{x: 7, y: 0}, %{x: 7, y: 4}],
      [%{x: 6, y: 4}, %{x: 2, y: 0}],
      [%{x: 0, y: 9}, %{x: 2, y: 9}],
      [%{x: 3, y: 4}, %{x: 1, y: 4}],
      [%{x: 0, y: 0}, %{x: 8, y: 8}],
      [%{x: 5, y: 5}, %{x: 8, y: 2}]
  ]
    result = part1(input)

    assert 5 == result
  end

  test "part2" do
    input = [
      [%{x: 0, y: 9}, %{x: 5, y: 9}],
      [%{x: 8, y: 0}, %{x: 0, y: 8}],
      [%{x: 9, y: 4}, %{x: 3, y: 4}],
      [%{x: 2, y: 2}, %{x: 2, y: 1}],
      [%{x: 7, y: 0}, %{x: 7, y: 4}],
      [%{x: 6, y: 4}, %{x: 2, y: 0}],
      [%{x: 0, y: 9}, %{x: 2, y: 9}],
      [%{x: 3, y: 4}, %{x: 1, y: 4}],
      [%{x: 0, y: 0}, %{x: 8, y: 8}],
      [%{x: 5, y: 5}, %{x: 8, y: 2}]
  ]
    result = part2(input)

    assert 12 == result
  end
end
