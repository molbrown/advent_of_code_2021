defmodule AdventOfCode.Day01 do
  def part1(input) do
    count =
    Stream.chunk_every(input, 2, 1, :discard)
    |> Enum.to_list()
    |> Enum.map( fn [a,b] ->
        case a do
          a when a < b -> 1
          _ -> 0
        end
      end)
    |> Enum.sum()

    IO.puts "\nthe number of times a depth measurement increases is: \ #{count} \."

    count
  end

  def part2(input) do
    count =
    Stream.chunk_every(input, 3, 1, :discard)
    |> Enum.to_list()
    |> Enum.map( fn chunk -> Enum.sum(chunk) end)
    |> part1()

    IO.puts "\nthe number of times the sum of measurements in this sliding window increases is: \ #{count} \."

    count
  end
end
