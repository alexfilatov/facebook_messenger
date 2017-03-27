defmodule FacebookMessenger.Model.Attachment do
  @type t ::
  FacebookMessenger.Model.Attachment.Image.t
  | FacebookMessenger.Model.Attachment.Audio.t
  | FacebookMessenger.Model.Attachment.Video.t
  | FacebookMessenger.Model.Attachment.File.t

  defmodule Image do
    defstruct type: "image", payload: %{url: nil}
    @type t :: %Image{type: binary, payload: %{url: binary}}
  end

  defmodule Audio do
    defstruct type: "audio", payload: %{url: nil}
    @type t :: %Audio{type: binary, payload: %{url: binary}}
  end

  defmodule Video do
    defstruct type: "video", payload: %{url: nil}
    @type t :: %Video{type: binary, payload: %{url: binary}}
  end

  defmodule File do
    defstruct type: "file", payload: %{url: nil}
    @type t :: %File{type: binary, payload: %{url: binary}}
  end
end


defmodule FacebookMessenger.Model.Attachment.Button do
  @type t ::
  FacebookMessenger.Model.Attachment.Button.URLButton.t
  | FacebookMessenger.Model.Attachment.Button.PostbackButton.t
  | FacebookMessenger.Model.Attachment.Button.CallButton.t
  | FacebookMessenger.Model.Attachment.Button.ShareButton.t
  | FacebookMessenger.Model.Attachment.Button.BuyButton.t
  | FacebookMessenger.Model.Attachment.Button.LogIn.t
  | FacebookMessenger.Model.Attachment.Button.LogOut.t


  defmodule URLButton do
    defstruct type: "web_url", title: nil, url: nil, webview_height_ratio: "full",
    messenger_extensions: nil, fallback_url: nil, webview_share_button: nil

    @type t :: %URLButton{
      type: binary, title: binary, url: binary, webview_height_ratio: binary,
      messenger_extensions: boolean, fallback_url: binary, webview_share_button: binary
    }
  end

  defmodule PostbackButton do
    defstruct type: "postback", title: nil, payload: nil
    @type t :: %PostbackButton{ type: binary, title: binary, payload: binary }
  end

  defmodule CallButton do
    defstruct type: "phone_number", title: nil, payload: nil
    @type t :: %CallButton{ type: binary, title: binary, payload: binary }
  end

  defmodule ShareButton do
    defstruct type: "element_share"
    @type t :: %ShareButton{ type: binary }
  end

  defmodule BuyButton do
    defstruct type: "payment",
    title: "buy", # Title of Buy Button. Must be "buy".
    payload: nil, payment_summary: nil
    @type t :: %BuyButton{ type: binary, title: binary, payload: FacebookMessenger.Model.Payment.PaymentSummary.t }
  end

  defmodule LogIn do
    defstruct type: "account_link", url: ""
    @type t :: %LogIn{ type: binary, url: binary }
  end

  defmodule LogOut do
    defstruct type: "account_unlink"
    @type t :: %LogOut{ type: binary }
  end

end


defmodule FacebookMessenger.Model.Attachment.Template do
  @type t ::
  FacebookMessenger.Model.Attachment.Template.Generic.t
  | FacebookMessenger.Model.Attachment.Template.List.t
  | FacebookMessenger.Model.Attachment.Template.Button.t
  | FacebookMessenger.Model.Attachment.Template.Receipt.t

  defmodule Generic do
    defstruct type: "template",
    payload: %{template_type: "generic", image_aspect_ratio: "horizontal", elements: []}

    @type t :: %Generic{
      type: binary,
      payload: %{template_type: binary, image_aspect_ratio: binary, elements: List.t}
    }

    def elements(template, elements) do
      # Kernel.put_in(template, [:payload, :elements], elements)
      Kernel.put_in(template.payload.elements, elements)
    end
  end

  defmodule List do
    defstruct type: "template",
    payload: %{template_type: "list", elements: [], buttons: nil}

    @type t :: %List{
      type: binary,
      payload: %{template_type: binary, elements: List.t, buttons: List.t}
    }

    def elements(template, elements) do
      Kernel.put_in(template.payload.elements, elements)
    end
  end
end

defmodule FacebookMessenger.Model.Attachment.Template.Element.DefaultAction do
  defstruct type: "web_url", url: nil, webview_height_ratio: "full",
  messenger_extensions: nil, fallback_url: nil, webview_share_button: nil

  @type t :: %{
    type: binary, url: binary, webview_height_ratio: binary,
    messenger_extensions: boolean, fallback_url: binary, webview_share_button: binary
  }
end


defmodule FacebookMessenger.Model.Attachment.Template.Element do
  defstruct title: nil, image_url: nil, subtitle: nil, default_action: nil, buttons: []
  @type t :: %{title: binary, image_url: binary, subtitle: binary,
    default_action: FacebookMessenger.Model.Attachment.Template.Element.DefaultAction.t, buttons: List.t}
end

defmodule FacebookMessenger.Model.Message do
  defstruct text: nil, quick_replies: nil
  @type t :: %{text: binary, quick_replies: List.t}
end
