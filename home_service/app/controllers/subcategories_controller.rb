class SubcategoriesController < ApplicationController 
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  
  # GET /subcategories
  # GET /subcategories.json
  def index
    @subcategories = Subcategory.all
  end

  # GET /subcategories/1
  # GET /subcategories/1.json
  def show
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
  end

  # GET /subcategories/1/edit
  def edit
  end

  # POST /subcategories
  # POST /subcategories.json
  def create
    #@subcategory = Subcategory.new(subcategory_params)
    
    # need to find the right @category with this id
    # I am sure why I able to get :category_id here, but not finding :vendor in services controller
    @category = Category.find(params[:category_id])
    # for has_many I need to use @category.subcategories.new 
    # and I need to use new_subcategory_params, because I can't not use requeire(:services)
    # see below for more details
    @subcategory = @category.subcategories.new(new_subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to @subcategory, notice: 'Subcategory was successfully created.' }
        format.json { render :show, status: :created, location: @subcategory }
      else
        format.html { render :new }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcategories/1
  # PATCH/PUT /subcategories/1.json
  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to @subcategory, notice: 'Subcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.json
  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to subcategories_url, notice: 'Subcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
    # k for edit, show, update, destroy, I use form_with with model in _form.html.erb
    # <%= form_with(model: @subcategory, local: true) do |form| %>
    # so there is model :subcategory in params for me to use in require(:subcategory)
    def subcategory_params
      params.require(:subcategory).permit(:subname, :category_id)
      #params.permit(:id, :subname, :category_id)
    end
    
    #k: for new, I use the form_with with url in new_form.html.erb
    # <%= form_with(url: category_subcategories_path, local: true) do |form| %> 
    # therefore, there is no model to pass into params, that is why I need to 
    # take out require(:subctegory)
    def new_subcategory_params
       #params.require(:subcategory).permit(:subname, :category_id)
       params.permit(:id, :subname, :category_id)
     end
end
