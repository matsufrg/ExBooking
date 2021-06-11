defmodule Exbooking.Bookings.Agent do
  alias Exbooking.Bookings.Booking

  use Agent

  def start_link(_param), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%Booking{id_usuario: id_usuario} = booking) do
    Agent.update(__MODULE__, &update_state(&1, id_usuario, booking))

    {:ok, id_usuario}
  end

  def update_state(state, uuid, %Booking{} = booking) do
    Map.put(state, uuid, booking)
  end

  def list_all() do
    Agent.get(__MODULE__, & &1)
  end

  def get(id) do
    case Agent.get(__MODULE__, &Map.get(&1, id)) do
      nil -> {:error, "Flight Booking not found"}
      booking -> {:ok, booking}
    end
  end
end
