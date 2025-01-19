defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:milliliter, value}), do: {:milliliter, value}

  def to_milliliter({:cup, value}), do: {:milliliter, value * 240}

  def to_milliliter({:fluid_ounce, value}), do: {:milliliter, value * 30}

  def to_milliliter({:teaspoon, value}), do: {:milliliter, value * 5}

  def to_milliliter({:tablespoon, value}), do: {:milliliter, value * 15}

  def from_milliliter({:milliliter, volume}, :milliliter), do: {:milliliter, volume}

  def from_milliliter({:milliliter, volume}, :cup), do: {:cup, volume / 240}

  def from_milliliter({:milliliter, volume}, :fluid_ounce), do: {:fluid_ounce, volume / 30}

  def from_milliliter({:milliliter, volume}, :teaspoon), do: {:teaspoon, volume / 5}

  def from_milliliter({:milliliter, volume}, :tablespoon), do: {:tablespoon, volume / 15}

  def convert(value_pair, tag) do
    value_pair |> to_milliliter() |> from_milliliter(tag)
  end
end
