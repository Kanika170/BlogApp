class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_comment, only: [:destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
  		redirect_to @post, notice: 'Comment created successfully'
  	else
  		redirect_to @post, alert: 'Comment could not be created'
  	end
	end

	def destroy
		@comment.destroy
		redirect_to posts_url, notice: 'Comment deleted successfully'
	end

	private

  def comment_params
  	params.require(:comment).permit(:body)
  end

  def set_comment
  	@comment = Comment.find(params[:id])
  end
end