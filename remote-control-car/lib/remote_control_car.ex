defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    %RemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: nickname
    }
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery}) do
    case battery do
      0 ->
        "Battery empty"

      _ ->
        "Battery at #{battery}%"
    end
  end

  def drive(%RemoteControlCar{
        battery_percentage: battery,
        distance_driven_in_meters: distance,
        nickname: nickname
      }) do
    if battery >= 1 do
      %RemoteControlCar{
        battery_percentage: battery - 1,
        distance_driven_in_meters: distance + 20,
        nickname: nickname
      }
    else
      %RemoteControlCar{
        battery_percentage: battery,
        distance_driven_in_meters: distance,
        nickname: nickname
      }
    end
  end
end
