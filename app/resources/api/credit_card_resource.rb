module Api
  class CreditCardResource < JSONAPI::Resource
    model_name "::Core::CreditCard"
    attributes :id
  end
end
