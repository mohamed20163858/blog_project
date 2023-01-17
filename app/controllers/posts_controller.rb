class PostsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @comment = Comment.new
    @like = Like.new
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.save
    redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
