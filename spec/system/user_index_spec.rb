require 'rails_helper'

RSpec.describe 'User index page Capybara integration test', type: :system do
  it 'test seeing the username of all other users' do
    visit '/users'
    expect(page).to have_content('User name: Tom')
  end
  
end
