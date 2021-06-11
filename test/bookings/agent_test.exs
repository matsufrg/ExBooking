defmodule Exbooking.Bookings.AgentTest do
  use ExUnit.Case

  import Exbooking.Factory

  alias Exbooking.Bookings.Agent, as: BookingAgent

  describe "save/1" do
    test "When the param are valid, return a booking uuid" do
      BookingAgent.start_link(%{})

      response =
        :booking
        |> build()
        |> BookingAgent.save()

      assert {:ok, _uuid} = response
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link(%{})
      :ok
    end

    test "When the user is found, return a booking" do
      {:ok, uuid} =
        :booking
        |> build()
        |> BookingAgent.save()

      response = BookingAgent.get(uuid)

      expected_response =
        {:ok,
         %Exbooking.Bookings.Booking{
           cidade_destino: "Rio de Janeiro",
           cidade_origem: "São Paulo",
           data_completa: "28/01/1999 18:05:28",
           id_usuario: "4e0afdb7-b59f-4c58-9883-49d9e1199c0e"
         }}

      assert expected_response == response
    end

    test "When the user is not found, returns an error" do
      response = BookingAgent.get("123456")

      expected_response = {:error, "Flight Booking not found"}

      assert expected_response == response
    end
  end
end
