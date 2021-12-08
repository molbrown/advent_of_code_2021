defmodule AdventOfCode.Day07 do
  def part1(input) do
    (Enum.min(input)..Enum.max(input))
    |> Enum.map(&fuel_for_position(&1, input))
    |> Enum.min()
  end

  def part2(_args) do
  end

  def fuel_for_position(position, crabs) do
    Enum.reduce(crabs, 0, fn c, acc -> 
      abs(c - position) + acc
    end)
  end
end
