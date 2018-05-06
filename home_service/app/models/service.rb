class Service < ApplicationRecord
  belongs_to :vendor
  belongs_to :subcategory
  
  validates_presence_of :service_name
  validates_presence_of :description
  validates_presence_of :rate
  
  def self.search(search_str)
    # @results = Service.where(description.matches("%#{search_str}%"))
    @results = Service.where("description ILIKE ?", "%#{search_str}%")
  end
    
end
