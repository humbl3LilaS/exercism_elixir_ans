defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(current_state) do
    receive do
      {:report_state, sender_id} ->
        send(sender_id, current_state)

        loop(current_state)

      {:take_a_number, sender_id} ->
        send(sender_id, current_state + 1)
        loop(current_state + 1)

      :stop ->
        :nill

      _ ->
        loop(current_state)
    end
  end
end
