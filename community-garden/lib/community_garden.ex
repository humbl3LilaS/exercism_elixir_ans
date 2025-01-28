# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> {0, []} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {_, registery} -> registery end) |> Enum.reverse()
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {current_id, registery} ->
      {%Plot{plot_id: current_id + 1, registered_to: register_to},
       {current_id + 1, [%Plot{plot_id: current_id + 1, registered_to: register_to} | registery]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {current_id, state} ->
      {current_id, Enum.filter(state, &(&1.plot_id != plot_id))}
    end)
  end

  def get_registration(pid, plot_id) do
    list_registrations(pid)
    |> Enum.find({:not_found, "plot is unregistered"}, &(&1.plot_id == plot_id))
  end
end
