require 'rails_helper'
require './spec/support/session_helpers'
RSpec.describe 'Genre Track landing page', type: :system do
  describe 'landing' do
    it 'shows the login page' do
      visit root_path
      expect(page).to have_current_path('/')
    end
  end

  describe 'redirect to landing' do
    it 'redirects unregistered user to login page' do
      visit genres_path
      expect(page).to have_current_path('/login')
    end
  end

  describe 'not allow guests in' do
    it 'blocks guests from loading in to the app' do
      visit external_path
      expect(page).not_to have_current_path('/external')
    end
  end

  describe 'expect wrong username' do
    it 'checks if the username is in database' do
      visit login_path
      fill_in('Name', with: 'Test5')
      click_button('Log in')
      expect(page).to have_current_path('/')
    end
  end
end
