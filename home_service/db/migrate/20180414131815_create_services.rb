class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :service_name
      t.text :description
      t.float :rate
      t.float :rating, default: 0
      t.references :vendor, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
