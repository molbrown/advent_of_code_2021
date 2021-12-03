defmodule AdventOfCode.Day03 do
  def part1(input) do
    num_length = 
    List.first(input)
    |> String.length

    [{gamma, _}, {epsilon, _}] = 
    Range.new(0, num_length - 1)
    |> Enum.reduce(["", ""], fn index, [g, e] ->
      zero = count_bit(input, "0", index)
      one = count_bit(input, "1", index)

      case one do
        one when one > zero -> [g <> "1", e <> "0"]
        one when one < zero -> [g <> "0", e <> "1"]
      end
    end)
    |> Enum.map(fn x -> Integer.parse(x, 2) end)

    gamma * epsilon
  end

  def part2(args) do
  end

  defp count_bit(input, bit, position) do
    Enum.count(input, fn x -> bit == binary_part(x, position, 1)end)
  end
end
