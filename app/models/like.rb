class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :AuthorId
  belongs_to :post, class_name: 'Post', foreign_key: :AuthorId
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:LikesCounter)
  end
end
