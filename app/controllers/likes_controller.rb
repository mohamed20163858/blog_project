class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = Like.new(like_params)
    @like.author = current_user
    @like.save
    redirect_to "/users/#{flash[:post_author_id]}/posts/#{@like.post_id}"
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
