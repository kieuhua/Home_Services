class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :find_commentable

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    #@comment = Comment.new(comment_params)
   @comment = @commentable.comments.new(comment_params)
 
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
       # format.html { redirect_to @commentable.comments, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|

      #if @comment.update(comment_params)
      # k I guess, bc I def find_commentable; therefore @commentable is valid
      if @commentable.comments.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to all_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment 
      @comment = Comment.find(params[:id])     
     # @comment = Comment.find(params[:id])
     # byebug
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params  
      params.fetch(:client, {})   
      params.require(:comment).permit( :title, :description, :commentable_id, :commentable_type) 
    end

   def find_commentable
     # @commentable = Client.find(params[:client_id]) if params[:client_id]    
     # for now
      if current_user.client?
         @commentable = current_user.client 
      else 
         @commentable = current_user.vendor
      end     
   end
end
