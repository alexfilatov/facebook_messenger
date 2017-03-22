defmodule FacebookMessenger.Model.QuickReply do
  defstruct text: nil, attachment: nil, quick_replies: nil
  @type t :: %FacebookMessenger.Model.QuickReply{text: binary, attachment: FacebookMessenger.Model.Attachment.t, quick_replies: List.t}
end

# TODO: add attachment
defmodule FacebookMessenger.Model.QuickReply.Text do
  defstruct content_type: "text", title: nil, payload: nil, image_url: nil
  @type t :: %FacebookMessenger.Model.QuickReply.Text{content_type: binary, title: binary, payload: binary, image_url: binary}
end

defmodule FacebookMessenger.Model.QuickReply.Location do
  defstruct content_type: "text", title: nil, payload: nil, image_url: nil
  @type t :: %FacebookMessenger.Model.QuickReply.Location{content_type: binary, title: binary, payload: binary, image_url: binary}
end
