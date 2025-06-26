
Code.require_file("../qtools/qfil.ex", __DIR__)
Code.require_file("../qtools/qcli.ex", __DIR__)
Code.require_file("../qtools/qstr.ex", __DIR__)

lines = QFil.get_lines_from_file("./data/flashcards.txt")
QCli.message("Read #{length(lines)} lines from flashcards.txt")

flashcards =
  lines
  |> Enum.chunk_every(4)
  |> Enum.reduce([], fn chunk, acc ->
    [category, front, back | _] = Enum.map(chunk, &String.trim(&1 || "")) ++ ["", "", ""]
    suuid = QStr.generate_suuid()

    if category != "" and front != "" and back != "" do
      [%{
        "suuid" => suuid,
        "category" => category,
        "front" => front,
        "back" => back
      } | acc]
    else
      idx = Enum.find_index(lines, fn l -> l == List.first(chunk) end) || 0
      QCli.message("Skipping incomplete flashcard at lines #{idx + 1}-#{idx + 3}", "warning")
      acc
    end
  end)
  |> Enum.reverse()

QCli.message("Generated #{length(flashcards)} flashcards")

# Save flashcards to JSON file
json_data = Jason.encode_to_iodata!(flashcards, pretty: true)
case File.write("./parseddata/flashcards.json", json_data) do
  :ok ->
    QCli.message("Wrote #{length(flashcards)} flashcards to flashcards.json")
  {:error, _reason} ->
    QCli.message("Error writing flashcards to JSON file", "error")
end
