class Package < ActiveRecord::Base
  has_many :payment_transactions
end
