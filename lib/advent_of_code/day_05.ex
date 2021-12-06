defmodule AdventOfCode.Day05 do
  def part1(input) do
    vents = 
    input
    |> regular_lines()

    ocean_floor = 
    List.duplicate(0, max_axis(vents, :x) + 1)
    |> List.duplicate(max_axis(vents, :y) + 1)

    Enum.reduce(vents, ocean_floor, fn vent, floor -> 
      map_vent(vent, floor)
    end)
    |> Enum.flat_map(fn row -> Enum.reject(row, fn x -> x <= 1 end) end)
    |> Enum.count()
  end

  def part2(input) do
    ocean_floor = 
    List.duplicate(0, max_axis(input, :x) + 1)
    |> List.duplicate(max_axis(input, :y) + 1)

    Enum.reduce(input, ocean_floor, fn vent, floor ->
      map_vent(vent, floor)
    end)
    |> Enum.flat_map(fn row -> Enum.reject(row, fn x -> x <= 1 end) end)
    |> Enum.count()
  end

  def regular_lines(lines) do
    Enum.filter(lines, fn line -> regular(line, :x) || regular(line, :y) end)
  end

  def regular(line, axis) do
    Map.get(Enum.at(line, 0), axis) == Map.get(Enum.at(line, 1), axis)
  end

  def max_axis(line, axis) do
    line
    |> Enum.flat_map(fn line -> Enum.map(line, fn p -> Map.get(p, axis) end) end)
    |> Enum.max()
  end

  def map_vent([%{x: x1, y: y1}, %{x: x2, y: y2}], floor) when x1 == x2 do
    min = Enum.min([y1, y2])
    max = Enum.max([y1, y2])

    floor
    |> Enum.with_index()
    |> Enum.map(fn {row, index} -> 
      case index do
        index when index < min -> row
        index when index > max -> row
        _ -> add_vertical_vent(row, x1)
      end

    end)
  end

  def map_vent([%{x: x1, y: y1}, %{x: x2, y: y2}], floor) when y1 == y2 do
    min = Enum.min([x1, x2])
    max = Enum.max([x1, x2])

    floor
    |> Enum.with_index()
    |> Enum.map(fn {row, index} -> 
      case index do
        index when index == y1 -> add_horizontal_vent(row, min, max)
        _ -> row
      end
    end)
  end

  def map_vent([%{x: x1, y: y1}, %{x: x2, y: y2}], floor) do
    Enum.zip((x1..x2), (y1..y2))
    |> Enum.reduce(floor, fn {x, y}, floor -> 
      new_row = List.update_at(Enum.at(floor, y), x, &(&1 + 1))
      List.replace_at(floor, y, new_row)
    end)
  end

  def add_horizontal_vent(row, min, max) do
    Enum.with_index(row)
    |> Enum.map(fn {p, index} -> 
      case index do
        index when index < min -> p
        index when index > max -> p
        _ -> p + 1
      end
    end)
  end

  def add_vertical_vent(row, x) do
    List.update_at(row, x, &(&1 + 1))
  end
end
