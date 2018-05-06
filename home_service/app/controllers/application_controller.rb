class ApplicationController < ActionController::Base  
  #include Pundit
  before_action :authenticate_user!
  protect_from_forgery with: :exception, prepend: true
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # want this helper to access anywhere and anytime
  helper_method :current_order
  
  def current_order
    if !current_user.client?
      redirect_to root_path, alert: "You are not a client, therefore, you can't order items."
    end
    
    #Order.hello
    # call order class method to find the current order of the current_user.client
    # if no active order then create a new order
   # order = Order.find_or_create_current_order(current_user.client.id)
    Order.find_or_create_current_order(current_user.client)
    
=begin  
    if current_user.client.orders.nil? || current_user.client.orders.empty?    
      order = current_user.client.orders.new do |m|
         m.active!
         m.total = 0
      end
      order.save!
    else
       # active_orders is defined in client.rb
       active_orders = current_user.client.active_orders
       # return the first active order of client as current_order
       active_orders.first
   end
=end
  end
  
  protected
  def configure_permitted_parameters
     # sign up parameters
     # Kieu need to permit more attributes: is_client, is_vendor
     devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :admin, :role])
  end

  private
  def after_sign_out_path_for(reource_or_scope)     
     #root_path  # back to default path of devise, which is root
     new_user_session_path
  end
 
end
