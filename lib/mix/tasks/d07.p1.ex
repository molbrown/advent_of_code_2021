defmodule Mix.Tasks.D07.P1 do
  use Mix.Task

  import AdventOfCode.Day07

  @shortdoc "Day 07 Part 1"
  def run(args) do
    input = get_input()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end

  defp get_input do
    "../../data/day_07.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.split(&1, ","))
    |> Enum.at(0)
    |> Enum.map(&String.to_integer/1)
  end
end
