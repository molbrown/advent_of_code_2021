defmodule AdventOfCode.Day01 do
  def part1(input) do
    Stream.chunk_every(input, 2, 1, :discard)
    |> Enum.to_list()
    |> Enum.count( fn [a,b] -> a < b end)
  end

  def part2(input) do
    Stream.chunk_every(input, 3, 1, :discard)
    |> Enum.to_list()
    |> Enum.map( fn chunk -> Enum.sum(chunk) end)
    |> part1()
  end
end
