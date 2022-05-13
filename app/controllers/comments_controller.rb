class CommentsController < ApplicationController

	after_action :set_comment_count, only: [:create]

	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

		render json: { data: { comment: @comment } }
  end

	def update_like_count
		@comment = Comment.find(params[:id])
		@comment.update(likes_count: @comment.likes_count + 1)
	end

  private

  def comment_params
    params.require(:comment).permit(:user, :comment)
  end

	def set_comment_count
		@post = Post.find(params[:post_id])
		@post.update(comment_count: @post.comments.count + 1)
	end
end
