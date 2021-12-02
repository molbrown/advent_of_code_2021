defmodule AdventOfCode.Day02 do
  def part1(input) do
    {x, y} = 
    Enum.map(input, fn command -> String.split(command, " ") end)
    |> Enum.map(fn [a, b] -> [a, String.to_integer(b)] end)
    |> Enum.split_with(fn [a, _] -> a == "forward" end)
    
    position = Enum.reduce(x, 0, fn [a, b], total -> b + total end)

    depth = 
    Enum.reduce(y, 0, fn [a, b], total -> 
      case a do
      "up" -> total - b
      "down" -> total + b
      end
    end)

    position * depth
  end

  def part2(_args) do
  end
end
