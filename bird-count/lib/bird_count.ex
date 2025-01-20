defmodule BirdCount do
  def today([head | _]) do
    head
  end

  def today([]), do: nil

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def increment_day_count([]), do: [1]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  def total(list), do: total(0, list)

  def total(acc, []), do: acc

  def total(acc, [head | tail]), do: total(acc + head, tail)

  def busy_days(list) do
    busy_days(0, list)
  end

  def busy_days(acc, []), do: acc
  def busy_days(acc, [head | tail]) when head >= 5, do: busy_days(acc + 1, tail)
  def busy_days(acc, [_ | tail]), do: busy_days(acc, tail)
end
