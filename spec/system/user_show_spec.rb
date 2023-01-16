require 'rails_helper'
RSpec.describe 'User show page Capybara integration test', type: :system do
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
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_css("img[src*='https://i.ibb.co/CP4m1b4/img.jpg']")
  end
  it 'test seeing the  the user username' do
    first_user = User.first
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_content("User name: #{first_user.name}")
  end
  it 'test seeing the  the user number of posts' do
    first_user = User.first
    number_of_posts = first_user.posts_counter
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_content("Number of posts: #{number_of_posts}")
  end
  it 'test seeing the  the user bio' do
    first_user = User.first
    bio = first_user.bio
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_content(bio.to_s)
  end
  it 'test seeing the  the user first post' do
    first_user = User.first
    post_1_text = first_user.posts.first.text
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_content(post_1_text.to_s)
  end
  it 'test seeing the  the user second post' do
    first_user = User.first
    post_2_text = first_user.posts.first(2)[1].text
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_content(post_2_text.to_s)
  end
  it 'test seeing the  the user third post' do
    first_user = User.first
    post_3_text = first_user.posts.first(3)[2].text
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_content(post_3_text.to_s)
  end
  it 'test seeing the see all posts button inside user show page' do
    first_user = User.first
    visit "/users/#{first_user.id}"
    sleep(1)
    expect(page).to have_button('See all posts')
  end
  it "test redirecting to that post's show page" do
    first_user = User.first
    visit "/users/#{first_user.id}"
    sleep(1)
    id = page.find_all('.post')[0][:id]
    page.find_all('.post')[0].click
    expect(page).to have_current_path("/users/#{first_user.id}/posts/#{id}")
  end
  it "test redirecting to that post's index page when clicking see all posts button" do
    first_user = User.first
    visit "/users/#{first_user.id}"
    sleep(1)
    click_button('See all posts')
    expect(page).to have_current_path("/users/#{first_user.id}/posts")
  end
end
