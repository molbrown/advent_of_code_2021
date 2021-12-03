defmodule Mix.Tasks.D03.P2 do
  use Mix.Task

  import AdventOfCode.Day03

  @shortdoc "Day 03 Part 2"
  def run(args) do
    input = get_input()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end

  defp get_input do
    "../../data/day_03.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.to_list()
  end
end
