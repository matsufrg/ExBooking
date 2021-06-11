defmodule Exbooking.Bookings.CreateOrUpdate do
  alias Exbooking.Bookings.Booking
  alias Exbooking.Bookings.Agent, as: BookingAgent

  use Agent

  def call(%{
        data_completa: data_completa,
        cidade_origem: cidade_origem,
        cidade_destino: cidade_destino,
        id_usuario: id_usuario
      }) do
    BookingAgent.start_link(%{})

    Booking.build(data_completa, cidade_origem, cidade_destino, id_usuario)
    |> save_user()
  end

  defp save_user({:ok, user}) do
    BookingAgent.save(user)
  end
end
