class Order < ApplicationRecord 
  # after_initialize with :if => :new_record? == before_create I think
  before_create :set_default_status
  before_save :update_total
  
  enum status: [:active, :done, :cancel]
  # scopes
  scope :order_active, -> { where(status: :active) }  # :active = 0
  scope :order_done, -> { where(status: :done) }      # :done = 1
  scope :order_cancel, -> { where(status: :cancel)}   # :cancel = 2
  
  # when add the new scope, need to quit and re-enter rails console
  #> Order.order_active.to_sql
  # => "SELECT \"orders\".* FROM \"orders\" WHERE \"orders\".\"status\" = 0" 
  #> Order.order_done.to_sql
  # => "SELECT \"orders\".* FROM \"orders\" WHERE \"orders\".\"status\" = 1" 
  #> Order.order_cancel.to_sql
  #=> "SELECT \"orders\".* FROM \"orders\" WHERE \"orders\".\"status\" = 2"
   
  belongs_to :client
  has_many :order_items, dependent: :destroy
  
  # allow order to destroy order_item w/o destroying itself
  accepts_nested_attributes_for :order_items, allow_destroy: true
  
  # calculate total
  def total
     # not sure what valid? come from validations in order_items model
     order_items.collect { |oi| oi.valid? ? oi.total_price : 0}.sum
  end
  
  def self.hello
     
  end 
  
  def self.find_or_create_current_order(client)
     # find the active orders belongs the client
     client_orders = Order.where(["client_id = ? and status = ? ", client.id, 0])
     if client_orders.nil? || client_orders.empty?
        # create a new active order
        create_new_order(client)
     else
        # return the existing active order of the client
        # a client should only has one active order
        client_orders.first
     end
  end
  
private
   def set_default_status
      self.status ||= :active
   end
   
   ## important, dynamically update total, client can't write any arbitrary value to this field
   # this function override total field, but we can still access the field by self[:total]
   def update_total
      self[:total] = total
   end
   
   # it needs to be class method to be able to call from class method
   def self.create_new_order(client)
       order = client.orders.new do |m|
        m.active!
        m.total = 0
     end
     order.save!
  end
end
