defmodule AdventOfCode.Day07Test do
  use ExUnit.Case

  import AdventOfCode.Day07

  test "part1" do
    input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
    result = part1(input)

    assert 37 == result
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
