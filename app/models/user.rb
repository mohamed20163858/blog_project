class User < ApplicationRecord
  has_many :comments, foreign_key: :AuthorId
  has_many :posts, foreign_key: :AuthorId
  has_many :likes, foreign_key: :AuthorId

  def check_last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
