class RemoveClientIdFromOrderItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_items, :client_id
  end
end
