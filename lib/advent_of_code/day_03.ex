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

  def part2(input) do
    {oxy, _} = select_oxy(input, 0)
    {co2, _} = select_co2(input, 0)

    oxy * co2
  end

  defp select_oxy(set, index) when length(set) > 1 do
    zero = count_bit(set, "0", index)
    one = count_bit(set, "1", index)

    case one do
      one when one == zero -> select_oxy(Enum.filter(set, fn x -> "1" == what_bit(x, index) end), index + 1)
      one when one > zero -> select_oxy(Enum.filter(set, fn x -> "1" == what_bit(x, index) end), index + 1)
      one when one < zero -> select_oxy(Enum.filter(set, fn x -> "0" == what_bit(x, index) end), index + 1)
    end
  end

  defp select_oxy([set], _index) do
    Integer.parse(set, 2)
  end

  defp select_co2(set, index) when length(set) > 1 do
    zero = count_bit(set, "0", index)
    one = count_bit(set, "1", index)

    case one do
      one when one == zero -> select_co2(Enum.filter(set, fn x -> "0" == what_bit(x, index) end), index + 1)
      one when one > zero -> select_co2(Enum.filter(set, fn x -> "0" == what_bit(x, index) end), index + 1)
      one when one < zero -> select_co2(Enum.filter(set, fn x -> "1" == what_bit(x, index) end), index + 1)
    end
  end

  defp select_co2([set], _index) do
    Integer.parse(set, 2)
  end

  defp count_bit(input, bit, position) do
    Enum.count(input, fn x -> bit == what_bit(x, position)end)
  end

  defp what_bit(num, position) do
    binary_part(num, position, 1)
  end
end
