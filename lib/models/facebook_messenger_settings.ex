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

defmodule FacebookMessenger.Model.ProfileSettings.PersistentMenu do
  @moduledoc """
  Facebook thread settings struct
  """
  @derive [Poison.Encoder]
  defstruct [:persistent_menu]

  @type t :: %FacebookMessenger.Model.ProfileSettings.PersistentMenu{
    persistent_menu: List.t
  }
end
