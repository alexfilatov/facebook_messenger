defmodule FacebookMessenger.Read do
  @moduledoc """
  Facebook message delivery structure
  %{"read" => %{"seq" => 0, "watermark" => 1490003715059}}
  """

  # defstruct mids: nil, seq: nil, watermark: nil

  @derive [Poison.Encoder]
  defstruct [:seq, :watermark]

  @type t :: %FacebookMessenger.Read{
    seq: integer,
    watermark: integer
  }
end
