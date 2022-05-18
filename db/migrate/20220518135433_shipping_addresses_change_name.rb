class ShippingAddressesChangeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :shipping_addresses, :cutomer_id, :customer_id
  end
end
