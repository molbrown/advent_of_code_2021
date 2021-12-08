defmodule AdventOfCode.Day07 do
  def part1(input) do
    (Enum.min(input)..Enum.max(input))
    |> Enum.map(&fuel_for_position(&1, input, "part 1"))
    |> Enum.min()
  end

  def part2(input) do
    (Enum.min(input)..Enum.max(input))
    |> Enum.map(&fuel_for_position(&1, input, "part 2"))
    |> Enum.min()
  end

  def fuel_for_position(position, crabs, "part 1") do
    Enum.reduce(crabs, 0, fn c, acc -> 
      abs(c - position) + acc
    end)
  end

  def fuel_for_position(position, crabs, "part 2") do
    Enum.reduce(crabs, 0, fn c, acc -> 
      diff = abs(c - position)
      fuel = diff * (diff + 1)/2
      fuel + acc
      |> round()
    end)
  end
end
