defmodule Exbooking.Factory do
  use ExMachina

  alias Exbooking.Users.User
  alias Exbooking.Bookings.Booking

  def user_factory do
    %User{
      name: "Robert",
      cpf: "12345678900",
      email: "matsufrg@gmail.com",
      id: "4e0afdb7-b59f-4c58-9883-49d9e1199c0e"
    }
  end

  def booking_factory do
    %{id: id} = build(:user)

    %Booking{
      cidade_destino: "Rio de Janeiro",
      cidade_origem: "São Paulo",
      data_completa: "28/01/1999 18:05:28",
      id_usuario: id
    }
  end
end
