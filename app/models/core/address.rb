class Core::Address < ActiveRecord::Base
  belongs_to :user
  has_many :addresses
  has_many :credit_cards
end
