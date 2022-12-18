class Post < ApplicationRecord 
  has_many :comments, foreign_key: :PostId
  has_many :likes,  foreign_key: :PostId
  belongs_to :author, class_name: 'User', foreign_key: :AuthorId
  after_save :update_posts_counter 

  def check_last_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:PostsCounter)
  end
end