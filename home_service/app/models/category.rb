class Category < ApplicationRecord
   has_many :subcategories, dependent: :destroy
   
   validates_presence_of :name
   
   accepts_nested_attributes_for :subcategories, allow_destroy: true
end
