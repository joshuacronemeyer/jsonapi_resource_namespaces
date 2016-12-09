require 'test_helper'

class Core::CreditCardTest < ActiveSupport::TestCase
  test "the association" do
    u = Core::User.create
    u.credit_cards.create
    assert !Core::CreditCard.where(user_id: u.id).first.nil?
  end
end
