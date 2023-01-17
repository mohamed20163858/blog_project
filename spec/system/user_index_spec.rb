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
  it 'test seeing the  username of first user' do
    visit users_path
    sleep(1)
    expect(page).to have_content('User name: Tom')
  end
  it 'test seeing the  username of second user' do
    visit users_path
    sleep(1)
    expect(page).to have_content('User name: Lilly')
  end
  it 'test seeing the  pic of first and second user' do
    visit users_path
    sleep(1)
    expect(page).to have_css("img[src*='https://i.ibb.co/CP4m1b4/img.jpg']")
  end
  it 'test seeing the  number of posts created by first user' do
    visit users_path
    sleep(1)
    first_user = User.first
    expect(page).to have_content("Number of posts: #{first_user.posts_counter}")
  end
  it 'test seeing the  number of posts created by second user' do
    visit users_path
    sleep(1)
    second_user = User.last
    expect(page).to have_content("Number of posts: #{second_user.posts_counter}")
  end
  it 'test redirecting to first user show page' do
    visit users_path
    sleep(1)
    page.find_all('.card')[0].click
    first_user = User.first
    expect(page).to have_current_path("/users/#{first_user.id}")
  end
end
