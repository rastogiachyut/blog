class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:index_blog]
  # before_action :create_comment, only: [:index, :index_blog]


  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts
  end

  def index_blog
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def search
    # write search function here
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new()
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  # FIXME_DONE: On creating a new post a blank post is created and saved too.
  def create
    # @post = current_user.posts.create(user_id: current_user.id)
    # debugger
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path, notice: "Congrats #{ current_user.first_name } on your new post." 
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    debugger
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to user_posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # def create_comment
    #   @comment = current_user.new()
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :text)
    end

end
