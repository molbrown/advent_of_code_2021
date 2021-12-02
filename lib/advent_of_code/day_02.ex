defmodule AdventOfCode.Day02 do
  def part1(input) do
    {x, y} = 
    Enum.map(input, fn command -> String.split(command, " ") end)
    |> Enum.map(fn [a, b] -> [a, String.to_integer(b)] end)
    |> Enum.split_with(fn [a, _] -> a == "forward" end)
    
    position = Enum.reduce(x, 0, fn [_a, b], total -> b + total end)

    depth = 
    Enum.reduce(y, 0, fn [a, b], total -> 
      case a do
      "up" -> total - b
      "down" -> total + b
      end
    end)

    position * depth
  end

  def part2(input) do
    start = {0, 0, 0}

    {x, y, _aim} = 
    Enum.map(input, fn command -> String.split(command, " ") end)
    |> Enum.map(fn [a, b] -> [a, String.to_integer(b)] end)
    |> Enum.reduce(start, fn [a, b], {x, y, aim} ->
      case a do
        "up" -> {x, y, aim - b}
        "down" -> {x, y, aim + b}
        "forward" -> calculate_position(b, x, y, aim)
      end
    end)

    x * y
  end

  defp calculate_position(b, x, y, 0) do
    {x + b, y, 0}
  end

  defp calculate_position(b, x, y, aim) do
    {x + b, b * aim + y, aim}
  end
end
