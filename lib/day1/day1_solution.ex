defmodule Day1.Solution do
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
