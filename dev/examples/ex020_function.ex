defmodule StringUtils do
	def capitalize(str) do
		String.capitalize(str)
	end
end

IO.puts(StringUtils.capitalize("testing"))