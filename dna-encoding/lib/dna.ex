defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    encode(<<>>, dna)
  end

  defp encode(acc, [head | tail]) do
    encode(<<acc::bitstring, encode_nucleotide(head)::4>>, tail)
  end

  defp encode(acc, []) do
    acc
  end

  def decode(dna) do
    decode([], dna) |> Enum.reverse()
  end

  defp decode(acc, <<>>) do
    acc
  end

  defp decode(acc, <<head::4, tail::bitstring>>) do
    decode([decode_nucleotide(head) | acc], tail)
  end
end
