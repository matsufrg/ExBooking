defmodule Exbooking.Users.UserTest do
  use ExUnit.Case

  alias Exbooking.Users.User

  describe "build/3" do
    test "When all params are valid, returns the user" do
      response = User.build("Roberto", "teste@gmail.com", "123456789")

      assert {:ok, %User{}} = response
    end

    test "When cpf is an integer" do
      response = User.build("Roberto", "teste@gmail.com", 12_345_678_900)

      expected_response = {:error, "CPF needs to be an string"}

      assert response == expected_response
    end
  end
end
