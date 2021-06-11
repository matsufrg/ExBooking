defmodule Exbooking.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exbooking.Users.CreateOrUpdate, as: CreateOrUpdateUsers
  alias Exbooking.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "When all params are valid, return a tuple" do
      response =
        CreateOrUpdateUsers.call(%{
          name: "Roberto",
          email: "teste@gmail.com",
          cpf: "12345678900"
        })

      assert {:ok, _uuid} = response
    end

    test "When a param is invalid, return an error" do
      response =
        CreateOrUpdateUsers.call(%{
          name: "Roberto",
          email: "teste@gmail.com",
          cpf: 12_345_678_900
        })

      expected_response = {:error, "CPF needs to be an string"}

      assert expected_response == response
    end
  end
end
