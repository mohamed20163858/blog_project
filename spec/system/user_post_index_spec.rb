require 'rails_helper'
RSpec.describe 'User post index page Capybara integration test', type: :system do
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
    Like.create(post: first_post, author: first_user)
  end
  it "test seeing the user's profile picture" do
    first_user = User.first
    visit '/users/' + first_user.id.to_s + '/posts'
    sleep(1)
    expect(page).to have_css("img[src*='https://i.ibb.co/CP4m1b4/img.jpg']")
  end
  it "test seeing the user username" do
    first_user = User.first
    visit '/users/' + first_user.id.to_s + '/posts'
    sleep(1)
    expect(page).to have_content('User name: ' + first_user.name.to_s)
  end
  it "test seeing the user number of posts" do
    first_user = User.first
    number_of_posts = first_user.posts_counter
    visit '/users/' + first_user.id.to_s + '/posts'
    sleep(1)
    expect(page).to have_content('Number of posts: ' + number_of_posts.to_s)
  end
  it "test seeing the user post title " do
    first_user = User.first
    post_title = first_user.posts.first.title
    visit '/users/' + first_user.id.to_s + '/posts'
    click_button('Pagination')
    sleep(1)
    expect(page).to have_content(post_title.to_s)
  end
  it "test seeing the user post body" do
    first_user = User.first
    post_body = first_user.posts.first.text
    visit '/users/' + first_user.id.to_s + '/posts'
    click_button('Pagination')
    sleep(1)
    expect(page).to have_content(post_body.to_s)
  end
  it "test seeing the user post first comment" do
    first_user = User.first
    post_first_comment = first_user.posts.first.comments.first.text
    visit '/users/' + first_user.id.to_s + '/posts'
    click_button('Pagination')
    sleep(1)
    expect(page).to have_content(post_first_comment.to_s)
  end
  it "test seeing the number of comments in a certain post" do
    first_user = User.first
    number_of_comments = first_user.posts.first.comments_counter
    visit '/users/' + first_user.id.to_s + '/posts'
    sleep(1)
    expect(page).to have_content('Comments: ' + number_of_comments.to_s)
  end
  it "test seeing the number of likes in a certain post" do
    first_user = User.first
    number_of_likes = first_user.posts.first.likes_counter
    visit '/users/' + first_user.id.to_s + '/posts'
    click_button('Pagination')
    sleep(1)
    expect(page).to have_content('Likes: ' + number_of_likes.to_s)
  end
  it "test the functionality of  pagination button " do
    first_user = User.first
    post_3_title = first_user.posts.first(3)[2].title
    visit '/users/' + first_user.id.to_s + '/posts'
    click_button('Pagination')
    sleep(1)
    expect(page).to have_content(post_3_title.to_s)
  end
  it "test redirecting to that post's show page" do
    first_user = User.first
    visit '/users/' + first_user.id.to_s + '/posts'
    sleep(1)
    id = page.find_all('.post')[0][:id]
    page.find_all('.post')[0].click
    expect(page).to have_current_path("/users/#{first_user.id}/posts/#{id}")
  end
end
