defmodule Day1.Solution do
  @moduledoc """
  Solution for the first of the exercise
  """
  alias Utils.CSVLineParser

  def run(file_path) do
    file_path
    |> CSVLineParser.parse_file()
    |> calculate_calibration_value()
  end

  def calculate_calibration_value(input) do
    input
    |> Enum.map(&transform_string_to_digit/1)
    |> Enum.sum()
  end

  def transform_string_to_digit(input_string) do
    input_string
    |> String.codepoints()
    |> Enum.reject(&String.match?(&1, ~r/[[:alpha:]]/))
    |> get_transformed_number()
  end

  defp get_transformed_number([]), do: 0
  defp get_transformed_number([char]), do: String.to_integer(String.duplicate(char, 2))

  defp get_transformed_number([first | _] = codepoints),
    do: String.to_integer("#{first}#{hd(Enum.reverse(codepoints))}")
end

defmodule Day1.Solution.Part2 do
  @moduledoc """
  Solution for the second part of the exercise
  """
  alias Utils.CSVLineParser

  @letter_to_number %{
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
  }

  def run(file_path) do
    file_path
    |> CSVLineParser.parse_file()
    |> calculate_calibration_value()
    |> IO.inspect()
  end

  def calculate_calibration_value(input) do
    input
    |> Enum.map(&transform_string_to_digit/1)
    |> Enum.sum()
  end

  def transform_string_to_digit(input_string) do
    @letter_to_number
    |> Enum.reduce(input_string, fn {word, number}, string ->
      String.replace(string, "#{word}", "#{word}#{number}#{word}", global: true)
    end)
    |> String.codepoints()
    |> Enum.reject(&String.match?(&1, ~r/[[:alpha:]]/))
    |> get_transformed_number()
  end

  defp get_transformed_number([]), do: 0
  defp get_transformed_number([char]), do: String.to_integer(String.duplicate(char, 2))

  defp get_transformed_number([first | _] = codepoints),
    do: String.to_integer("#{first}#{hd(Enum.reverse(codepoints))}")
end
