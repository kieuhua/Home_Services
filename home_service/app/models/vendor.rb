class Vendor < ApplicationRecord
  belongs_to :user
  
  has_many :services, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates_presence_of :company_name
  
  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :services, allow_destroy: true  
end
