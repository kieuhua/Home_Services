class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def create
    #@order_item = OrderItem.new(order_item_params)
    #byebug
    # current_order helper_method in ApplicationController should return an order
    # or a flash message "You are not a client ...", then redirect_to root_path
    @order = current_order
    #byebug
    @order_item = @order.order_items.new(order_item_params)
    #@order_item = @order.order_items.build(order_item_params)
    @order_item.save
    render 'create'
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)  
    #byebug
    render 'update' 
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    render 'destroy'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:unit_price, :quantity, :total_price, :order_id, :service_id)
    end
end
