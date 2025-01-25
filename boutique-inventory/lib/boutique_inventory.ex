defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort(fn x, y ->
      x[:price] <= y[:price]
    end)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(fn x ->
      is_nil(x[:price])
    end)
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn x ->
      new_name = String.replace(x[:name], old_word, new_word)
      %{x | name: new_name}
    end)
  end

  def increase_quantity(item, count) do
    new_qantities =
      item[:quantity_by_size] |> Enum.map(fn {k, v} -> {k, v + count} end) |> Enum.into(%{})

    %{item | quantity_by_size: new_qantities}
  end

  def total_quantity(item) do
    item[:quantity_by_size] |> Map.values() |> Enum.reduce(0, &+/2)
  end
end
