defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> mothly_rate_before_dicount()
    |> apply_discount(discount)
    |> ceil()
  end

  defp mothly_rate_before_dicount(rate) do
    rate * 22
  end

  def days_in_budget(budget, hourly_rate, discount) do
    require Float
    discounted_rate = hourly_rate |> daily_rate() |> apply_discount(discount)
    (budget / discounted_rate) |> Float.floor(1)
  end
end
