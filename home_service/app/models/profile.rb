class Profile < ApplicationRecord
   mount_uploader :avatar, AvatarUploader
    
  belongs_to :user  
  
  # validates
  validates_presence_of :phone
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  
end
