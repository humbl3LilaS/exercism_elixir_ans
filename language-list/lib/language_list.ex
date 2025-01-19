defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) when length(list) > 0 do
    [language | list]
  end

  def add([], language) do
    [language]
  end

  def remove([_ | tail]) do
    tail
  end

  def first([head | _]) do
    head
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
