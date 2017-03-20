defmodule FacebookMessenger.Message do
  @moduledoc """
  Facebook message structure
  """

  @derive [Poison.Encoder]
  defstruct [:mid, :seq, :text, :quick_reply]

  @type t :: %FacebookMessenger.Message{
    mid: String.t,
    seq: integer,
    quick_reply: Map.t,
    text: String.t
  }
end
