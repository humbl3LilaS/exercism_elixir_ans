defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(time) do
    40 - time
  end

  def preparation_time_in_minutes(layer) do
    layer * 2
  end

  def total_time_in_minutes(layer, time_in_oven) do
    layer * 2 + time_in_oven
  end

  def alarm do
    "Ding!"
  end
end
