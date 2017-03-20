defmodule FacebookMessenger.Model.Greeting do
  defstruct setting_type: "greeting",
    greeting: %{text: nil} # limit 160 chars
    
  @type t :: %{setting_type: binary, greeting: Map.t}
  @doc """
  Creates a greeting struct with text
  """
  def create(text) do
    greeting = %FacebookMessenger.Model.Greeting{}
    put_in(greeting.greeting.text, text)
  end
end
