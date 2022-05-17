class ShippingAddress < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code, presence: true, length: {maximum: 7}
  validates :address, presence: true
  validates :name, presence: true

end
