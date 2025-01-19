defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:cup, value}), do: {:milliliter, value * 240}

  def to_milliliter({:fluid_ounce, value}), do: {:milliliter, value * 30}

  def to_milliliter({:teaspoon, value}), do: {:milliliter, value * 5}

  def to_milliliter({:tablespoon, value}), do: {:milliliter, value * 15}

  def to_milliliter({:milliliter, value}), do: {:milliliter, value}

  def convert(volume_pair, :cup) do
    {_, value} = to_milliliter(volume_pair)
    {:cup, value / 240}
  end

  def convert(volume_pair, :fluid_ounce) do
    {_, value} = to_milliliter(volume_pair)
    {:fluid_ounce, value / 30}
  end

  def convert(volume_pair, :teaspoon) do
    {_, value} = to_milliliter(volume_pair)
    {:teaspoon, value / 5}
  end

  def convert(volume_pair, :tablespoon) do
    {_, value} = to_milliliter(volume_pair)
    {:tablespoon, value / 15}
  end

  def convert(volume_pair, :milliliter) do
    {_, value} = to_milliliter(volume_pair)
    {:milliliter, value}
  end

  def from_milliliter(volume_pair, tag) do
    convert(volume_pair, tag)
  end
end
