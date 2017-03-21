defmodule FacebookMessenger.Model.Settings do
  @moduledoc """
  Facebook thread settings struct
  """
  @derive [Poison.Encoder]
  defstruct [:setting_type, :thread_state, :call_to_actions, :greeting]

  @type t :: %FacebookMessenger.Model.Settings{
    setting_type: binary,
    thread_state: binary,
    greeting: Map.t,
    call_to_actions: List.t
  }
end
