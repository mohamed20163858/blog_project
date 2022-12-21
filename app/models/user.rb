class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :bio, presence: true, length: { minimum: 3, maximum: 150 }
  validates :posts_counter, presence: true, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  def check_last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
