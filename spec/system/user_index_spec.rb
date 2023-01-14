require 'rails_helper'
RSpec.describe 'User index page Capybara integration test', type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end
  it 'test seeing the username of all other users' do
    visit users_path
    sleep(5)
    expect(page).to have_text('User name: Tom')
  end
  
end
