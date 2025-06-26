Code.require_file("../qtools/qcli.ex", __DIR__)
Code.require_file("../developer/learn.ex", __DIR__)

defmodule Main do
  def run do
    args = System.argv()
    case args do
      [exercise_number | _] ->
        function_name = String.to_atom("ex#{exercise_number}")
        if function_exported?(Learn, function_name, 0) do
          QCli.message("learn script: #{exercise_number}", "info")
          apply(Learn, function_name, [])
        else
          show_help("Exercise number '#{exercise_number}' does not exist.")
        end
      _ ->
        show_help("No exercise number provided.")
    end
  end

  defp show_help(reason) do
    QCli.message(reason, "error")
    QCli.message("Usage: elixir cmd-learn.ex <exercise_number>", "info")
    available = Learn.__info__(:functions)
    |> Enum.filter(fn {name, arity} -> arity == 0 and to_string(name) =~ ~r/^ex\d+$/ end)
    |> Enum.map(fn {name, _} -> String.replace_prefix(to_string(name), "ex", "") end)
    |> Enum.sort()
    QCli.message("Available exercise numbers: #{Enum.join(available, ", ")}", "info")
  end
end

Main.run()
