defmodule QCli do
  @moduledoc """
  Quick tools for CLI commands
  """

  @doc """
  Prints a CLI message with emoji indicators

  ## Parameters
    - line: The message to display
    - kind: The type of message (info, error, success, warning, doing, ball)
  """
  def message(line, kind \\ "success") do
    prefix =
      case kind do
        "info" -> "ℹ️  "
        "error" -> "❌ "
        "warning" -> "⚠️  "
        "doing" -> "⏳ "
        "ball" -> "🟠 "
        "star" -> "⭐ "
        _ -> "✅ "
      end

    IO.puts("#{prefix}#{line}")
  end
end
