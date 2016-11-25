class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]


  # GET /comments/new
  def new
    @comment = current_user.comments.new()
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to :back, notice: 'Comment was successfully created.'
    else
      redirect_to :back
    end
  end

  # # PATCH/PUT /comments/1
  # # PATCH/PUT /comments/1.json
  # def update
  #   if @comment.update(comment_params)
  #     redirect_to :back, notice: 'Comment was successfully updated.'
  #   else
  #     redirect_to :back
  #   end
  # end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    redirect_to :back, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.permit(:post_id, :text)
    end
end
