require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.new(
      name: 'Mateo Lane',
      photo: 'https://unsplash.com/photos/mateopic',
      bio: 'Comedian, Italian, Sylish, and part time youtuber',
      posts_counter: 6
    )
  end

  let(:post) do
    Post.new(
      author: user,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 1
    )
  end

  let(:like) do
    Like.new(
      author: user,
      post:
    )
  end

  it 'is only valid with a user' do
    like.author = user
    expect(like).to be_valid
  end

  it 'is valid with a post' do
    like.post = post
    expect(like).to be_valid
  end
end
