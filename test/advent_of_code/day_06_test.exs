defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  test "part1" do
    input = [3,4,3,1,2]
    result = part1(input)

    assert 5934 == result
  end

  @tag timeout: :infinity
  test "part2" do
    input = [3,4,3,1,2]
    result = part2(input)

    assert 26984457539 == result
  end
end
