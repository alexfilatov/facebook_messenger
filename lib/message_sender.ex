defmodule FacebookMessenger.Sender do
  @moduledoc """
  Module responsible for communicating back to facebook messenger
  """
  require Logger


  @doc """
  sends a message to the the recepient

  * :recepient - the recepient to send the message to
  * :message - the message to send
  """
  @spec send(String.t, String.t) :: HTTPotion.Response.t
  def send(recepient, message) do
    body = json_payload(recepient, message)
    Logger.info "ABOUNT TO SEND:: #{inspect body}"
    res = manager.post(
      url: url,
      body: body
    )
    Logger.info("RESPONSE FROM FB:: #{inspect(res)}")
    res
  end

  @doc """
  sends an attachment

  * :recepient - the recepient to send the message to
  * :attachment - the attachment FacebookMessenger.Model.Attachment.t
  """
  @spec send_attachment(String.t, FacebookMessenger.Model.Attachment.t) :: HTTPotion.Response.t
  def send_attachment(recepient, attachment) do
    Logger.info "ATTACHMENT:: #{inspect attachment}"
    body = json_payload_attachment(recepient, attachment)
    Logger.info "ABOUNT TO SEND:: #{inspect body}"
    res = manager.post(url: url, body: body)
    Logger.info("RESPONSE FROM FB:: #{inspect res}")
    res
  end

  @doc """
  sends an attachment

  * :settings - the attachment FacebookMessenger.Model.Settings.t
  """
  @spec send_settings(FacebookMessenger.Model.Settings.t) :: HTTPotion.Response.t
  def send_settings(settings) do
    Logger.info "SETTINGS:: #{inspect settings}"
    body = json_payload_settings(settings)
    Logger.info "ABOUNT TO SEND:: #{inspect body}"
    res = manager.post(url: settings_url, body: body)
    Logger.info("RESPONSE FROM FB:: #{inspect res}")
    res
  end

  @doc """
  creates a payload to send to facebook

  * :recepient - the recepient to send the message to
  * :message - the text message to send
  *
  """
  @spec payload(String.t, String.t) :: Map.t
  def payload(recepient, text) do
    %{
      recipient: %{id: recepient},
      message: %{text: text}
    }
  end

  @doc """
  creates a settings payload to send to facebook

  * :settings - the text message to send
  *
  """
  @spec payload(FacebookMessenger.Model.Settings.t) :: Map.t
  def payload(settings) do
    settings
  end

  @doc """
  creates a payload with attachment to send to facebook

  * :recepient - the recepient to send the message to
  * :attachment - the attachment object (picture, button, etc)
  *
  """
  @spec payload_attachment(String.t, FacebookMessenger.Model.Attachment.t) :: Map.t
  def payload_attachment(recepient, attachment) do
    %{
      recipient: %{id: recepient},
      message: %{attachment: attachment}
    }
  end

  @doc """
  creates a json payload to send to facebook

  * :recepient - the recepient to send the message to
  * :message - the message to send
  """
  @spec json_payload(String.t, String.t) :: String.t
  def json_payload(recepient, message) do
    payload(recepient, message)
    |> Poison.encode
    |> elem(1)
  end

  @doc """
  creates a json payload with attachment to send to facebook

  * :recepient - the recepient to send the message to
  * :attachment - the attachment
  """
  @spec json_payload_attachment(String.t, FacebookMessenger.Model.Attachment.t) :: String.t
  def json_payload_attachment(recepient, attachment) do
    payload_attachment(recepient, attachment)
    |> Poison.encode
    |> elem(1)
  end

  @doc """
  creates a json payload with settings to send to facebook

  * :settings - the settings struct
  """
  @spec json_payload_settings(FacebookMessenger.Model.Settings.t) :: String.t
  def json_payload_settings(settings) do
    payload(settings)
    |> Poison.encode
    |> elem(1)
  end


  @doc """
  return the url to hit to send the message
  """
  def url do
    query = "access_token=#{page_token}"
    "https://graph.facebook.com/v2.6/me/messages?#{query}"
  end

  def settings_url do
    query = "access_token=#{page_token}"
    "https://graph.facebook.com/v2.6/me/thread_settings?#{query}"
  end

  defp page_token do
    Application.get_env(:facebook_messenger, :facebook_page_token)
  end

  defp manager do
    Application.get_env(:facebook_messenger, :request_manager) || FacebookMessenger.RequestManager
  end
end
