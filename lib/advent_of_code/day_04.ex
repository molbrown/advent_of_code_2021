defmodule AdventOfCode.Day04 do

  def part1(input) do
    {win, win_num} = play_game(boards(input), draws(input), "first_win")

    calculate_score(win, win_num)
  end

  def part2(input) do
    {last_win, last_num} = play_game(boards(input), draws(input), "last_win")

    calculate_score(last_win, last_num)
  end

  defp draws(input) do
    Enum.at(input, 0)
    |> String.split(",")
  end

  # Create 2D Lists representing each bingo board
  defp boards(input) do
    Enum.drop(input, 1)
    |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
    |> Enum.chunk_every(5)
  end

  defp play_game(boards, draws, "first_win") do
    draws
    |> Enum.reduce_while(boards, fn draw, b -> 
      if bingo(b), do: {:halt, {b, last_draw(draws, draw)}}, else: {:cont, mark_boards(draw, b)}
    end)
  end

  defp play_game(boards, draws, "last_win") do
    draws
    |> Enum.reduce_while(boards, fn draw, b -> 
      if bingo(b), do: {:halt, {b, last_draw(draws, draw)}}, else: {:cont, filter_bingo(draw, b)}
    end)
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

  defp filter_bingo(draw, boards) when length(boards) == 1 do
    mark_boards(draw, boards)
  end

  defp filter_bingo(draw, boards) do
    mark_boards(draw, boards)
    |> Enum.reject(fn b -> horizontal(b) || vertical(b) end)
  end

  defp last_draw(draws, draw) do
    Enum.find_index(draws, fn x -> x == draw end)
    |> (&(Enum.at(draws, &1 - 1))).()
  end

  defp horizontal(board) do
    board
    |> Enum.any?(fn row -> Enum.all?(row, fn x -> x == "x" end) end)
  end

  defp vertical(board) do
    (0..4)
    |> Enum.any?(fn col -> Enum.all?(board, fn row -> Enum.at(row, col) == "x" end) end)
  end

  defp calculate_score(board, last_draw) do
    board
    |> Enum.find(fn board -> horizontal(board) || vertical(board) end)
    |> Enum.flat_map(fn row -> Enum.reject(row, fn x -> x == "x" end) end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.sum()
    |> Kernel.*(String.to_integer(last_draw))
  end
end
