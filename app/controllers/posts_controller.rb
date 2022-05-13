class PostsController < ApplicationController

  def index
    @posts = Post.all

    render json: { data: { posts: @posts } }
  end

  def show
    @post = Post.find(post_params[:id])

    render json: { data: {post: @post } }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: post_params[:title], post: post_params[:post])

    if @post.save
      render json: { data: {post: @post } }
    else
      render json: { message: "Something went wrong!"}, status: :unprocessable_entity
    end
  end

  def update_like_count
		@post = Post.find(params[:id])
		@post.update(likes_count: @post.likes_count + 1)
	end

  private
  def post_params
    params.require(:post).permit(:title, :post)
  end
end
