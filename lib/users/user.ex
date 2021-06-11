defmodule Exbooking.Users.User do
  @keys [:name, :email, :cpf]

  @enforce_keys @keys

  defstruct [:id | @keys]

  def build(name, email, cpf)
      when not is_integer(cpf) do
    uuid = UUID.uuid4()

    {:ok,
     %__MODULE__{
       name: name,
       email: email,
       cpf: cpf,
       id: uuid
     }}
  end

  def build(_name, _email, _cpf) do
    {:error, "CPF needs to be an string"}
  end
end
