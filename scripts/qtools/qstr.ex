defmodule QStr do
  @moduledoc """
  String utility methods
  """

  def generate_suuid do
    chars = ~c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    chars
    |> Enum.map(fn _ -> Enum.random(chars) end)
    |> Enum.take(6)
    |> List.to_string()
  end
end
""
