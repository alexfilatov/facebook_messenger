defmodule FacebookMessenger.Delivery do
  @moduledoc """
  Facebook message delivery structure
  %{"delivery" => %{"mids" => ["mid.1490002308200:10f489a202"], "seq" => 0, "watermark" => 1490002308200}
  """

  # defstruct mids: nil, seq: nil, watermark: nil
  @derive [Poison.Encoder]
  defstruct [:mids, :seq, :watermark]

  @type t :: %FacebookMessenger.Delivery{
    mids: List.t,
    seq: integer,
    watermark: integer
  }
end
