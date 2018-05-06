class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 3
      t.references :client, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
