defmodule Utils.CSVLineParser do
  def parse_file(file_path) do
    file_path
    |> File.read!()
    |> String.split(~r/\R/, trim: true)
    |> Enum.reject(&(String.trim(&1) == ""))
  end
end
