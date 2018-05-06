class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :set_update_or_create, only: [:create, :update]
 
  def index
    @users = User.all
    
  end
  
  # GET /users/1/edit
    def edit
    end
    
    def create         
       respond_to do |format|
         if @user.save
           format.html { redirect_to @user, notice: 'User was successfully created.' }
           format.json { render :show, status: :created, location: @user }
         else
           format.html { render :new }
           format.json { render json: @user.errors, status: :unprocessable_entity }
         end
       end
     end

  def show
   # @last_editor = last_editor(@user)
  end

  def update
    #if @user.update_attributes(params[:user])
     if @user.update_attributes(user_params)  
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end
  
  def destroy
     @user.destroy
     respond_to do |format|
       format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

  def admin?
     @user.admin
  end
  
  private
  def set_user
     #@user = current_user
     @user = User.find(params[:id])
   end
  def user_params
     params.fetch(:user, {})  
     params[:user]['role'] = params[:user]
     params.require(:user).permit(:firstname, :lastname, :role, :admin)
   end
=begin
  def update_or_create
     change_enum_to_i
  end
  def change_enum_to_i
     params[:user]['role'] = params[:user]['role'].to_i
  end
=end
end