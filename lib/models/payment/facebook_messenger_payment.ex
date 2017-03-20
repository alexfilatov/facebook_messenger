defmodule FacebookMessenger.Model.Payment.Price do
  defstruct label: nil, amount: nil
  @type t :: %{ label: binary, amount: binary }
end

defmodule FacebookMessenger.Model.Payment.PaymentSummary do
  defstruct currency: nil, is_test_payment: nil,
    payment_type: nil, # Must be "FIXED_AMOUNT" or "FLEXIBLE_AMOUNT".
    merchant_name: nil,
    requested_user_info: nil, # any of: ["shipping_address", "contact_name", "contact_phone", "contact_email"]
    price_list: nil

  @type t :: %{
    currency: binary, is_test_payment: boolean, payment_type: binary,
    merchant_name: binary, requested_user_info: List.t,
    price_list: List.t # List of FacebookMessenger.Model.Payment.Price.t
  }
end
