class Core::User < ActiveRecord::Base
  has_many :addresses
  has_many :credit_cards
end
