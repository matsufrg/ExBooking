defmodule Exbooking.Users.AgentTest do
  use ExUnit.Case

  import Exbooking.Factory

  alias Exbooking.Users.User
  alias Exbooking.Users.Agent, as: UserAgent

  describe "save/1" do
    test "When the user is saved, returns an tuple" do
      UserAgent.start_link(%{})

      response =
        :user
        |> build()
        |> UserAgent.save()

      expected_response = {:ok, "4e0afdb7-b59f-4c58-9883-49d9e1199c0e"}

      assert expected_response == response
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "When the user is found, returns the user" do
      :user
      |> build()
      |> UserAgent.save()

      response = UserAgent.get("4e0afdb7-b59f-4c58-9883-49d9e1199c0e")

      expected_response =
        {:ok,
         %User{
           cpf: "12345678900",
           email: "matsufrg@gmail.com",
           id: "4e0afdb7-b59f-4c58-9883-49d9e1199c0e",
           name: "Robert"
         }}

      assert response == expected_response
    end

    test "When the user isn't founded, returns an error" do
      response = UserAgent.get("123")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
