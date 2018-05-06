class CartController < ApplicationController
  def show
     #byebug
     @order_items = current_order.order_items
     #@order_item = @orer_items.first
    # @order = current_order
    render 'show'
  end
  
  def your_cart
     @orde_order_items = current_order.order_items
  end
  
  def checkout
     @order = current_order
     render 'checkout'
  end
  
  def place_order
     # need to change order status to done
     current_order.done!
     byebug
     # then your cart should be empty
     
     redirect_to root_path, alert: "Your order is completed."
  end
end
