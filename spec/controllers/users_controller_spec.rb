require 'rails_helper'

RSpec.describe 'User management', type: :request do
  it 'test the response status of users main page is ok' do
    get '/users'
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of users main page' do
    get '/users'
    expect(response).to render_template(:index)
  end
  it 'test the content of users main page' do
    get '/users'
    expect(response.body).to include('User name')
  end
  it 'test the response status of user show page is ok' do
    get "/users/#{rand(1...1000)}"
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of user show page' do
    get "/users/#{rand(1...1000)}"
    expect(response).to render_template(:show)
  end
  it 'test the content of user show page' do
    id = rand(1...1000).to_s
    get "/users/#{id}"
    expect(response.body).to include("Show user number #{id}")
  end
end
