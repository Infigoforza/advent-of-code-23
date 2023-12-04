defmodule AdventOfCode.Day02 do
  def part1(_args) do
    File.stream!("./lib/advent_of_code/day_02.txt")
    |> Enum.map(fn
      line ->
        [id, games] = id_and_games(line)

        valid =
          games
          |> Enum.all?(&game_possible?(&1))

        if valid, do: id, else: 0
    end)
    |> Enum.sum()
  end

  def part2(_args) do
    File.stream!("./lib/advent_of_code/day_02.txt")
    |> Enum.map(fn
      line ->
        [_, games] = id_and_games(line)

        games
        |> games_product()
    end)
    |> Enum.sum()
  end

  defp id_and_games(line) do
    [identifier, bags] = line |> String.trim() |> String.split(":")

    id =
      identifier
      |> String.replace(~r/[^\d]/, "")
      |> String.to_integer()

    games =
      bags
      |> String.split(";")
      |> Enum.map(&String.split(&1, ","))
      |> List.flatten()

    [id, games]
  end

  defp game_possible?(game) do
    amount = game |> String.replace(~r/[^\d]/, "") |> String.to_integer()

    (String.contains?(game, "red") && amount <= 12) ||
      (String.contains?(game, "green") && amount <= 13) ||
      (String.contains?(game, "blue") && amount <= 14)
  end

  defp games_product(games) do
    max_by_color(games, "green") * max_by_color(games, "red") * max_by_color(games, "blue")
  end

  defp max_by_color(games, color) do
    games
    |> Enum.filter(&String.contains?(&1, color))
    |> Enum.map(&(String.replace(&1, ~r/[^\d]/, "") |> String.to_integer()))
    |> Enum.max()
  end
end
