class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :postal_code
      t.string :name
      t.integer :method_of_payment, default: "0"
      t.integer :shipping_fee
      t.integer :billing_amount
      t.integer :order_status, default: "0"

      t.timestamps
    end
  end
end
