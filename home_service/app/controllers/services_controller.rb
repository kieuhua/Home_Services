class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index     
   # @services = Service.all  
    if params[:search]
       @services = Service.search(params[:search]).order("created_at DESC")
    else
       @services = Service.all.order("created_at DESC")
       #current_order = Order.new
       #byebug
       # can't do this, it needs to pass in params.
       # @order_item = current_order.order_items.new
       #@order_item = OrderItem.new
       # not sure???
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    #byebug
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    #@service = Service.new(service_params)
    
    # Kieu: need to find the right @vendor with this id
    byebug
    # with <%= form_with(model: service, local: true) do |form| %>
    # I don't params[:vendor_id] at this point. :vendor_id is permitted true in
    # service_params
    # @vendor = Vendor.find(params[:vendor_id])
    @vendor = current_user.vendor
     byebug
     #Kieu: for has_many I need to use @vendor.services.new 
     # and I also need to use new_subcategory_params, because I can't not use requeire(:services)
     # see below for more details
     #@service = @vendor.services.new(new_service_params)
     # I am going to try to use hidden field to pass in vendor id and subcategory_id
     # so I may able to use model with form
     #@service = @vendor.services.new(new_service_params)
     @service = @vendor.services.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
    # kieu: for edit, show, update, destroy, I use form_with with model in _form.html.erb
     # <%= form_with(model: service, local: true) do |form| %>
     # so there is model :service in params for me to use in require(:service)    
    def service_params
      params.require(:service).permit(:service_name, :description, :rate, :rating, :vendor_id, :subcategory_id)
    end

=begin
   #kieu, I no longer need this code, but I keep it to remember how I debug
    # <%= form_with(url: vendor_services_path, local: true) do |form| %>
    and
    <%= form_with(model: service, local: true) do |form| %>
   because I may run into this situation in the future    
    
    #kieu: for new, I use the form_with with url in new_form.html.erb
     # <%= form_with(url: vendor_services_path, local: true) do |form| %>
     # therefore, there is no model to pass into params, that is why I need to 
     # take out require(:service)
    def new_service_params
     byebug
      params.require(:service).permit(:service_name, :description, :rate, :rating, :vendor_id, :subcategory_id)
       # params.permit(:service, :service_name, :description, :rate, :rating, :vendor_id, :subcategory_id,)
    end
=end
end
