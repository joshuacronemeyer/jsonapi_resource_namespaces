module Api
  class UserResource < JSONAPI::Resource
    model_name "::Core::User"
    # model_hint model: ::Core::CreditCard, resource: :credit_card
    has_many :addresses
    has_many :credit_cards
    attributes :id
  end
end

