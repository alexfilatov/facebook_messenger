defmodule FacebookMessenger.RequestManager do
  require Logger
  @moduledoc """
  module respinsible to post a request to facebook
  """
  def post(url: url, body: body) do
    Logger.info "BODY:: #{inspect body}"

    HTTPotion.post url,
    body: body, headers: ["Content-Type": "application/json"]
  end
end

defmodule FacebookMessenger.RequestManager.Mock do
  @moduledoc """
  moc respinsible to post a request to facebook
  """

  def post(url: url, body: body) do
    send(self, %{url: url, body: body})
  end
end
