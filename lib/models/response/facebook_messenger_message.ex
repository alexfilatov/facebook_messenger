defmodule FacebookMessenger.Message do
  @moduledoc """
  Facebook message structure
  """

  @derive [Poison.Encoder]
  defstruct [:mid, :seq, :text, :quick_reply, :is_echo, :app_id, :attachments]

  @type t :: %FacebookMessenger.Message{
    mid: String.t,
    seq: integer,
    quick_reply: Map.t,
    text: String.t,
    is_echo: boolean,
    app_id: binary,
    attachments: List.t
  }
end
