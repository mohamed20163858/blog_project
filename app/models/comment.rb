class Comment < ApplicationRecord 
    belongs_to :author, class_name: 'User', foreign_key: :AuthorId
    belongs_to :post, class_name: 'Post', foreign_key: :PostId
    after_save :update_comments_counter
  
    private
  
    def update_comments_counter
      post.increment!(:CommentsCounter)
    end
end