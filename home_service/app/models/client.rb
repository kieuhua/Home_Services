class Client < ApplicationRecord
  belongs_to :user
  
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  validates_presence_of :credit_card
  
  # after I added this, then build_client works, before => undefine method
 #has_many :comments
 accepts_nested_attributes_for :comments, allow_destroy: true  
 accepts_nested_attributes_for :orders, allow_destroy: true
 
end

