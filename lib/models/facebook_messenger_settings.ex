defmodule FacebookMessenger.Model.Settings do
  @moduledoc """
  Facebook thread settings struct
  """
  @derive [Poison.Encoder]
  defstruct [:setting_type, :thread_state, :call_to_actions]

  @type t :: %FacebookMessenger.Model.Settings{
    setting_type: binary,
    thread_state: binary,
    call_to_actions: List.t
  }
end
