defmodule AdventOfCode.Day04 do
  def part1(input) do
    draws =
    Enum.at(input, 0)
    |> String.split(",")

    # Create 2D Lists representing each bingo board
    boards =
    Enum.drop(input, 1)
    |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
    |> Enum.chunk_every(5)

    {win, win_num} = 
    draws
    |> Enum.reduce_while(boards, fn draw, b -> 
      last_draw = Enum.find_index(draws, fn x -> x == draw end)

      if bingo(b), do: {:halt, {b, Enum.at(draws, last_draw - 1)}}, else: {:cont, mark_boards(draw, b)}
    end)
    
    win
    |> Enum.find(fn board -> horizontal(board) || vertical(board) end)
    |> Enum.flat_map(fn row -> Enum.reject(row, fn x -> x == "x" end) end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.sum()
    |> Kernel.*(String.to_integer(win_num))
  end

  def part2(_args) do
  end

  defp mark_boards(draw, boards)do
    boards
    |> Enum.map(fn board -> 
        Enum.map(board, fn row ->  
          match = Enum.find_index(row, fn x -> x == draw end)
          case match do
            nil -> row
            index -> List.replace_at(row, index, "x")
          end
        end) 
      end)
  end

  defp bingo(boards) do
    Enum.any?(boards, fn b -> horizontal(b) || vertical(b) end)
  end

  defp horizontal(board) do
    board
    |> Enum.any?(fn row -> Enum.all?(row, fn x -> x == "x" end) end)
  end

  defp vertical(board) do
    (0..4)
    |> Enum.any?(fn col -> Enum.all?(board, fn row -> Enum.at(row, col) == "x" end) end)
  end
end
