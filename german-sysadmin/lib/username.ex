defmodule Username do
  def sanitize(username) do
    process_string(~c"", username) |> List.flatten() |> Enum.reverse()
  end

  defp process_string(acc, [head | tail]) when head >= 97 and head <= 122,
    do: process_string([head | acc], tail)

  defp process_string(acc, [head | tail]) do
    case head do
      95 -> process_string([head | acc], tail)
      228 -> process_string([[101, 97] | acc], tail)
      246 -> process_string([[101, 111] | acc], tail)
      252 -> process_string([[101, 117] | acc], tail)
      223 -> process_string([[115, 115] | acc], tail)
      _ -> process_string(acc, tail)
    end
  end

  defp process_string(acc, []), do: acc
end
