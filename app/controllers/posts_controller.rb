class PostsController < ApplicationController
	before_action :authenticate_user!, except: %i[index show]
	before_action :set_post, only: %i[show edit update destroy]

  def index
  	@posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
  	
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user = current_user
  	if @post.save
  		redirect_to @post, notice: 'Post created successfully'
  	else
  		render :new, status: :unprocessable_entity
  	end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to @post, notice: 'Post updated successfully'
    else
    	render :edit, status: :unprocessable_entity
  	end
  end

  def destroy
  	@post.destroy 
  	redirect_to posts_url, notice: 'Post deleted successfully'
  end

  private

  def post_params
  	params.require(:post).permit(:title, :body)
  end

  def set_post
  	@post = Post.find(params[:id])
  end
end
