Code.require_file("../qtools/qcli.ex", __DIR__)

defmodule Learn do

  def ex001 do
    QCli.message("generate random numbers, sort, then reverse sort", "star")
    numbers = Enum.map(1..10, fn _ -> :rand.uniform(99) end)
    multiplied = Enum.map(numbers, fn x -> x * 10 end)
    |> Enum.sort()
    |> Enum.reverse()
    IO.inspect(multiplied)
  end

  def ex002 do
    QCli.message("recursive countdown from 10", "star")
    countdown(10)
  end

  defp countdown(n) when n < 1 do
    IO.puts("Blast off!")
  end

  defp countdown(n) do
    IO.puts(n)
    Process.sleep(200) # Small delay to see the countdown
    countdown(n - 1)
  end

end
