defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    rank_range() |> Range.to_list()
  end

  def files do
    file_range() |> Range.to_list() |> Enum.map(&to_string_literal/1)
  end

  defp to_string_literal(codepoint), do: <<codepoint>>
end
