defmodule AdventOfCode.Day01 do
  def part1(_args) do
    File.stream!("./lib/advent_of_code/day_01.txt")
    |> Stream.map(fn
      line ->
        numbers = line |> String.replace(~r/[^\d]/, "")
        first = numbers |> String.at(0)
        last = numbers |> String.at(-1)
        "#{first}#{last}" |> String.to_integer()
    end)
    |> Enum.sum()
  end

  def part2(_args) do
    File.stream!("./lib/advent_of_code/day_01.txt")
    |> Stream.map(fn
      line ->
        numbers =
          line
          |> to_numbers
          |> String.replace(~r/[^\d]/, "")

        first = numbers |> String.at(0)
        last = numbers |> String.at(-1)

        "#{first}#{last}" |> String.to_integer()
    end)
    |> Enum.sum()
  end

  def to_numbers("one" <> rest), do: "1" <> to_numbers("e" <> rest)
  def to_numbers("two" <> rest), do: "2" <> to_numbers("o" <> rest)
  def to_numbers("three" <> rest), do: "3" <> to_numbers("e" <> rest)
  def to_numbers("four" <> rest), do: "4" <> to_numbers("r" <> rest)
  def to_numbers("five" <> rest), do: "5" <> to_numbers("e" <> rest)
  def to_numbers("six" <> rest), do: "6" <> to_numbers(rest)
  def to_numbers("seven" <> rest), do: "7" <> to_numbers(rest)
  def to_numbers("eight" <> rest), do: "8" <> to_numbers("t" <> rest)
  def to_numbers("nine" <> rest), do: "9" <> to_numbers("e" <> rest)
  def to_numbers(<<char, rest::binary>>), do: <<char>> <> to_numbers(rest)
  def to_numbers(""), do: ""
end
