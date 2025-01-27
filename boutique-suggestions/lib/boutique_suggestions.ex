defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = Keyword.get(options, :maximum_price, 100.0)

    if !max_price do
      for x <- tops, y <- bottoms, x.base_color != y.base_color do
        {x, y}
      end
    else
      for x <- tops, y <- bottoms, x.base_color != y.base_color, x.price + y.price < max_price do
        {x, y}
      end
    end
  end
end
