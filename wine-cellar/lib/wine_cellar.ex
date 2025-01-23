defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color) do
    Keyword.get_values(cellar, color)
  end

  def filter(cellar, color, year: year) do
    Keyword.get_values(cellar, color)
    |> Enum.filter(fn wine ->
      {_, w_year, _} = wine
      w_year == year
    end)
  end

  def filter(cellar, color, country: country) do
    Keyword.get_values(cellar, color)
    |> Enum.filter(fn wine ->
      {_, _, w_country} = wine
      w_country == country
    end)
  end

  def filter(cellar, color, year: year, country: country) do
    Keyword.get_values(cellar, color)
    |> Enum.filter(fn wine ->
      {_, w_year, w_country} = wine
      w_year == year and w_country == country
    end)
  end

  def filter(cellar, color, country: country, year: year) do
    filter(cellar, color, year: year, country: country)
  end
end
