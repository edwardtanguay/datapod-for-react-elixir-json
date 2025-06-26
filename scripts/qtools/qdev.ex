defmodule QDev do
  @moduledoc """
  Utility methods for development
  """

  @doc """
  Prints a debug line with timestamp

  Example output:
  2025-04-14 18:18:06 ### was here ##############
  """
  def debug(obj) when is_binary(obj) do
    timestamp = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second) |> NaiveDateTime.to_string()
    IO.puts("🛠️  #{timestamp} - #{obj}")
  end

  def debug(obj) do
    IO.inspect(obj)
  end
end
