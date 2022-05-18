class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  validates :postal_code, presence: true, length: {maximum: 7}
  validates :address, presence: true
  validates :name, presence: true

  enum method_of_payment: {credit_card: 0, transfer: 1}
  enum shipping_address: {my_address: 0, registered_address: 1, new_address: 2}

end
