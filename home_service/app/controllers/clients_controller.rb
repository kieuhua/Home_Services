class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
     @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
   # @client = Client.new(client_params)
   @client = current_user.build_client(client_params)
   # @client = @client.build_client(client_params)

    respond_to do |format|          
      if @client.save  
       # after client save successful, then set current_user.role = 1
       current_user.client!
               
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
         
         
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy   
    @client.destroy
    
     # need to reset the role in user, after client is destroy
     current_user.user!
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
     # @client = current_user.client
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.fetch(:client, {})            
      params.require(:client).permit(:credit_card, :user_id)
    end
end
