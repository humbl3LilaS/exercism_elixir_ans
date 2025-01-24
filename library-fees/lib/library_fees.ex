defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    noon = datetime |> NaiveDateTime.to_date() |> NaiveDateTime.new!(~T[12:00:00])

    case NaiveDateTime.compare(datetime, noon) do
      :lt -> true
      _ -> false
    end
  end

  def return_date(checkout_datetime) do
    case before_noon?(checkout_datetime) do
      true ->
        NaiveDateTime.add(checkout_datetime, 28, :day) |> NaiveDateTime.to_date()

      false ->
        NaiveDateTime.add(checkout_datetime, 29, :day) |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    date_diff = planned_return_date |> Date.diff(NaiveDateTime.to_date(actual_return_datetime))

    if date_diff < 0 do
      abs(date_diff)
    else
      0
    end
  end

  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime)
    start_of_week = Date.beginning_of_week(date)

    case Date.compare(date, start_of_week) do
      :eq ->
        true

      _ ->
        false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_date = datetime_from_string(checkout) |> return_date()
    return_date = datetime_from_string(return)

    case monday?(datetime_from_string(return)) do
      false ->
        days_late(checkout_date, return_date) |> total_cost(rate)

      true ->
        days_late(checkout_date, return_date)
        |> total_cost(rate)
        |> div(2)
        |> floor()
    end
  end

  defp total_cost(late_date, rate) do
    late_date * rate
  end
end
