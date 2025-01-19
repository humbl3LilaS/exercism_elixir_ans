defmodule Secrets do
  def secret_add(secret), do: &(&1 + secret)

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: &(&1 * secret)

  def secret_divide(secret), do: &div(&1, secret)

  def secret_and(secret), do: &Bitwise.band(&1, secret)

  def secret_xor(secret), do: &Bitwise.bxor(&1, secret)

  def secret_combine(fn1, fn2), do: &(&1 |> fn1.() |> fn2.())
end
