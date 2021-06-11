defmodule Exbooking.Users.CreateOrUpdate do
  alias Exbooking.Users.User
  alias Exbooking.Users.Agent, as: UserAgent

  use Agent

  def call(%{name: name, email: email, cpf: cpf}) do
    UserAgent.start_link(%{})

    User.build(name, email, cpf)
    |> save_user()
  end

  defp save_user({:ok, user}) do
    UserAgent.save(user)
  end

  defp save_user({:error, _reason} = error) do
    error
  end
end
