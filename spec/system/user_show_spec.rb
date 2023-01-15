require 'rails_helper'
RSpec.describe 'User index page Capybara integration test', type: :system do
  before :all do
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    first_user = User.create(name: 'Tom', photo: 'https://i.ibb.co/CP4m1b4/img.jpg', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://i.ibb.co/CP4m1b4/img.jpg',
                              bio: 'Teacher from Poland.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    second_post = Post.create(author: first_user, title: 'Amazing App', text: 'This is my second post')
    third_post = Post.create(author: first_user, title: 'Fantastic', text: 'This is my third post')
    forth_post = Post.create(author: second_user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
    Comment.create(post: second_post, author: second_user, text: 'Amazing Tom!')
    Comment.create(post: third_post, author: second_user, text: 'Brilliant Tom!')
    Comment.create(post: forth_post, author: first_user, text: 'Brilliant Lilly!')
    Comment.create(post: first_post, author: first_user, text: 'Thanks Lilly!')
    Comment.create(post: second_post, author: first_user, text: 'Thanks Lilly!')
  end
  it "test seeing the  the user's profile picture" do
    first_user = User.first
    visit '/users/' + first_user.id.to_s
    sleep(1)
    expect(page).to have_css("img[src*='https://i.ibb.co/CP4m1b4/img.jpg']")
  end
  it "test seeing the  the user username" do
    first_user = User.first
    visit '/users/' + first_user.id.to_s
    sleep(1)
    expect(page).to have_content('User name: ' + first_user.name.to_s)
  end
end
