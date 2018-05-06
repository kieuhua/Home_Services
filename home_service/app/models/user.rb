class User < ApplicationRecord
   #include Profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  ALLOWED_ATTRIBUTES = [:firstname, :lastname, :admin, :role]
  
  enum role: [:user, :client, :vendor]
  after_initialize :set_default_role, :if => :new_record?
  
  # validates
  validates_presence_of :firstname
  validates_presence_of :lastname
  
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true
  
  # after I added this, then build_client works, before => undefine method
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client, allow_destroy: true
  
  has_one :vendor, dependent: :destroy
  accepts_nested_attributes_for :vendor, allow_destroy: true
  
  def fullname
     (firstname + " " + lastname).squeeze(" ")
  end
  private
  
  def set_default_role
       self.role ||= :user
  end
    
  def allowed_attributes
     ALLOWED_ATTRIBUTES
  end
end
