defmodule Exbooking.Users.Agent do
  alias Exbooking.Users.User

  use Agent

  def start_link(_param), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%User{id: id} = user) do
    Agent.update(__MODULE__, &update_state(&1, id, user))

    {:ok, id}
  end

  def update_state(state, uuid, %User{} = user), do: Map.put(state, uuid, user)

  def list_all() do
    Agent.get(__MODULE__, & &1)
  end

  def get(id) do
    case Agent.get(__MODULE__, &Map.get(&1, id)) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
