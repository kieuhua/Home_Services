class OrderItem < ApplicationRecord
  before_save :finalize
  
  # associations
  belongs_to :order
  belongs_to :service
  
  # validations
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
  # if there is already unit_price; otherwise take the rate from service
  def unit_price
     if persisted?
        self[:unit_price]
     else
         service.rate
     end
  end 
  
  def total_price
     unit_price * quantity
  end
  
private
     
   # this is important, make sure the price is not change during checkout time
   def finalize
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
   end
end
