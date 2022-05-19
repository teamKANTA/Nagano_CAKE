class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum production_status: {pending: 0, waiting_for_production: 1, working: 2, completed: 3}

end
