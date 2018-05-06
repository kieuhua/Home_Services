class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :services
  
  validates_presence_of :subname
end
