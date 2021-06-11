defmodule Exbooking.Bookings.BookingTest do
  use ExUnit.Case

  import Exbooking.Factory

  alias Exbooking.Bookings.Booking

  describe "build/3" do
    test "When all params are valid, returns a booking" do
      %{id: id} = build(:user)

      response = Booking.build("28/01/1999 20:05:00", "Rio de Janeiro", "São Paulo", id)

      expected_response =
        {:ok,
         %Booking{
           cidade_destino: "São Paulo",
           cidade_origem: "Rio de Janeiro",
           data_completa: ~N[1999-01-28 20:05:00],
           id_usuario: "4e0afdb7-b59f-4c58-9883-49d9e1199c0e"
         }}

      assert expected_response == response
    end
  end
end
