require 'rails_helper'
require './spec/support/session_helpers'
RSpec.describe "Genre Track landing page", type: :system do
  describe "landing" do
    it "shows the login page" do
      visit root_path
      expect(page).to have_current_path('/')
    end
  end

  describe "redirect to landing" do
    it "redirects unregistered user to login page" do
      visit genres_path
      expect(page).to have_current_path('/login')
    end
  end

  
end