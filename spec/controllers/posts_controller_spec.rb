require 'rails_helper'

RSpec.describe 'Post management', type: :request do
  it 'test the response status of posts main page is ok' do
    get '/users/:id/posts'
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of posts main page' do
    get '/users/:id/posts'
    expect(response).to render_template(:index)
  end
  # it 'test the content of posts main page' do
  #   get '/users/:id/posts'
  #   expect(response.body).to include('User name:')
  # end
  # it 'test the response status of post show page is ok' do
  #   get "/users/:id/posts/#{rand(1...1000)}"
  #   expect(response).to have_http_status(:ok)
  # end
  it 'test the render function of post show page' do
    get "/users/:id/posts/#{rand(1...1000)}"
    expect(response).to render_template(:show)
  end
  # it 'test the content of post show page' do
  #   id = rand(1...1000).to_s
  #   get "/users/:id/posts/#{id}"
  #   expect(response.body).to include('Username: comment10')
  # end
end
