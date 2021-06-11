defmodule Exbooking do
  alias Exbooking.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Exbooking.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking

  alias Exbooking.Users.Agent, as: UserAgent
  alias Exbooking.Bookings.Agent, as: BookingAgent

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_booking(params), to: CreateOrUpdateBooking, as: :call
  defdelegate get_booking(params), to: BookingAgent, as: :get
end
