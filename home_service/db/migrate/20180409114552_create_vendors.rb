class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :company_name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
