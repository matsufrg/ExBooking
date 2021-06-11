defmodule Exbooking.Bookings.Booking do
  @keys [:data_completa, :cidade_origem, :cidade_destino, :id_usuario]

  @enforce_keys @keys

  defstruct @keys

  def build(data_completa, cidade_origem, cidade_destino, id_usuario) do
    naive =
      data_completa
      |> parse_date()
      |> NaiveDateTime.from_iso8601!()

    {:ok,
     %__MODULE__{
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino,
       data_completa: naive,
       id_usuario: id_usuario
     }}
  end

  defp parse_date(datestring) do
    [date, time] = datestring |> String.split(" ")

    [dd, mm, yy] = date |> String.split("/")

    "#{yy}-#{mm}-#{dd} #{time}"
  end
end
