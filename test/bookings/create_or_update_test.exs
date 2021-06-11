defmodule Exbooking.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  import Exbooking.Factory

  alias Exbooking.Bookings.Agent, as: BookingAgent
  alias Exbooking.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking

  describe "call/1" do
    test "When all params are valid, returns a valid tuple" do
      %{id: id} = build(:user)

      response =
        CreateOrUpdateBooking.call(%{
          data_completa: "28/01/1999 20:20:05",
          cidade_origem: "Rio de Janeiro",
          cidade_destino: "São Paulo",
          id_usuario: id
        })

      expected_response = {:ok, "4e0afdb7-b59f-4c58-9883-49d9e1199c0e"}

      assert expected_response == response
    end
  end
end
