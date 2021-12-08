defmodule AdventOfCode.Day06 do
  def part1(input) do
    (1..80)
    |> Enum.reduce(input, fn _day, collection -> 
      increment_day(collection)
    end)
    |> Enum.count()
  end


  def part2(input) do
    counts =
      for x <- 0..8, into: [] do
        Enum.count(input, &(&1 == x))
      end

    counts 
    |> increment_day(0, 0, 0)
  end

  def increment_day(collection) do
    collection
    |> Enum.reduce(collection, fn x, c ->
      case x do
        x when x == 0 -> [9 | c]
        _ -> c
      end
    end)
    |> Enum.map(&spend_day/1)
  end

  def spend_day(fish) do
    case fish do
      fish when fish == 0 -> 6
      _ -> fish - 1
    end
  end

  def increment_day(fish_count, day, sevens, eights) when day == 256 do
    Enum.sum(fish_count) + sevens + eights
  end

  def increment_day(fish_count, day, sevens, eights) do
    zero_at = rem(day, 7)
    zero_count = Enum.at(fish_count, zero_at)

    List.replace_at(fish_count, zero_at, zero_count + sevens)
    |> increment_day(day + 1, eights, zero_count)
  end
end
