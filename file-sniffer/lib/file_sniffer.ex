defmodule FileSniffer do
  @exe_signature <<0x7F, 0x45, 0x4C, 0x46>>
  @bmp_signature <<0x42, 0x4D>>
  @png_signature <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>
  @jpg_signature <<0xFF, 0xD8, 0xFF>>
  @gif_signature <<0x47, 0x49, 0x46>>

  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
      _ -> nil
    end
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<@exe_signature, _::binary>> -> "application/octet-stream"
      <<@bmp_signature, _::binary>> -> "image/bmp"
      <<@png_signature, _::binary>> -> "image/png"
      <<@jpg_signature, _::binary>> -> "image/jpg"
      <<@gif_signature, _::binary>> -> "image/gif"
      _ -> nil
    end
  end

  def verify(file_binary, extension) do
    ext = type_from_extension(extension)
    bi = type_from_binary(file_binary)
    IO.puts("Binary #{bi}")
    IO.puts(ext)

    if is_same_ext?(ext, bi) do
      {:ok, ext}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end

  defp is_same_ext?(nil, nil), do: false
  defp is_same_ext?(x, y), do: x == y
end
