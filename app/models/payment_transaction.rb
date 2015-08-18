class PaymentTransaction < ActiveRecord::Base
	belongs_to :outlet
  belongs_to :package
end
