defmodule Mix.Tasks.D05.P2 do
  use Mix.Task

  import AdventOfCode.Day05

  @shortdoc "Day 05 Part 2"
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
    "../../data/day_05.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.split(&1, " -> "))
    |> Stream.map(&Enum.map(&1, fn x -> String.split(x, ",") end))
    |> Stream.map(&Enum.map(&1, fn x -> Enum.map(x, fn y -> String.to_integer(y) end) end))
    |> Stream.map(fn [[x1, y1], [x2, y2]] -> [%{x: x1, y: y1}, %{x: x2, y: y2}] end)
    |> Enum.to_list()
  end
end
