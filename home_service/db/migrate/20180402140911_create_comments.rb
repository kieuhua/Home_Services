class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title, limit: 250, default: ""
      t.text :description
      t.references :commentable, polymorphic: true

      t.timestamps null: false
    end
  end
end
