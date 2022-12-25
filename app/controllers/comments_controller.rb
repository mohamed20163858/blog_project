class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.save
    redirect_to "/users/#{flash[:post_author_id]}/posts/#{@comment.post_id}"
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
