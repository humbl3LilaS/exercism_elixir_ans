defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    request_path = path |> String.split(".")
    extract(data, request_path)
  end

  defp extract(nil, _arg) do
    nil
  end

  defp extract(acc, _) when not is_map(acc) do
    acc
  end

  defp extract(acc, [head | tail]) when is_map(acc) do
    extract(acc[head], tail)
  end

  defp extract(acc, []) do
    acc
  end

  def get_in_path(data, path) do
    keys = path |> String.split(".")
    Kernel.get_in(data, keys)
  end
end
