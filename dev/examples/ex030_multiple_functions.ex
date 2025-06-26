defmodule StringUtils do
	def capitalize(str) do
		String.capitalize(str)
	end

	def add_note(str) do
		str <> "--note"
	end
end

message = "testing"
IO.puts(StringUtils.capitalize(message))
IO.puts(StringUtils.add_note(message))

IO.puts("---")

message = "testing"
message = StringUtils.capitalize(message)
message = StringUtils.add_note(message)
IO.puts(message)