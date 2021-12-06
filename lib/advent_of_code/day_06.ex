defmodule AdventOfCode.Day06 do
  def part1(input) do
    (1..80)
    |> Enum.reduce(input, fn _day, collection -> 
      increment_day(collection)
    end)
    |> Enum.count()
  end

  def part2(_args) do
  end

  def increment_day(collection) do
    collection
    |> Enum.reduce(collection, fn x, c -> 
      case x do
        x when x == 0 -> [9 | c]
        _ -> c
      end
    end)
    |> Enum.map(fn x -> 
      case x do
        x when x == 0 -> 6
        _ -> x - 1
      end
    end)
  end
end
