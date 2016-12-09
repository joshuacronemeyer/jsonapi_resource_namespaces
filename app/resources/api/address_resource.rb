module Api
  class AddressResource < JSONAPI::Resource
    model_name "::Core::Address"
    attributes :id
  end
end
