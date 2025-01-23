defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    palette_bit_size(1, color_count)
  end

  defp palette_bit_size(acc, color_count) do
    if Integer.pow(2, acc) >= color_count do
      acc
    else
      palette_bit_size(acc + 1, color_count)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>
  end

  def prepend_pixel(<<>>, color_count, pixel_color_index) do
    size = palette_bit_size(color_count)
    <<pixel_color_index::size(size)>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    size = palette_bit_size(color_count)
    <<pixel_color_index::size(size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)
    <<head::size(size), _rest::bitstring>> = picture
    head
  end

  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)
    <<_::size(size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
