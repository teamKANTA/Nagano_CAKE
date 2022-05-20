class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true, length: {maximum: 7}
  validates :address, presence: true
  validates :telephone_number, presence: true, length: {maximum: 11}
  
  def self.looks(search, word)
    if search == "完全一致"
      @customer = Customer.where("family_name_kana LIKE?", "#{word}")
    elsif search == "曖昧検索"
      @customer = Customer.where("family_name_kana LIKE?", "%#{word}%")
    else
      @customer = Customer.all
    end
  end

end
