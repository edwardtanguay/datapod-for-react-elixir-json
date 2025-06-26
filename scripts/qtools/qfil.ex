Code.require_file("./qcli.ex", __DIR__)

defmodule QFil do
  @moduledoc """
  File utility methods
  """

  @doc """
  Reads a file and returns its lines as a list of strings.

  Example:
      lines = QFil.get_lines_from_file("../data/flashcards.txt")

  Returns an empty list if the file cannot be read.
  """
  def get_lines_from_file(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        String.split(content, ~r/\r?\n/, trim: false)

      {:error, reason} ->
          QCli.message("Error reading file at #{file_path}: #{inspect(reason)}", "error")
        []
    end
  end
end
