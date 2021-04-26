require 'rails_helper'
require './spec/support/session_helpers'
RSpec.describe GenresController, type: :controller do
  describe 'GET index' do
    it 'should get index' do
      user = create(:user)
      log_in(user)
      get :index
      should render_template('index')
    end
  end

  describe 'GET show' do
    it 'should get show' do
      user = create(:user)
      genre = create(:genre)
      log_in(user)
      get :show, params: { id: genre.id }
      should render_template('show')
    end
  end

  describe 'DELETE destroy' do
    it 'should delete the genre' do
      user = create(:user)
      genre = create(:genre)
      log_in(user)
      expect do
        delete :destroy, params: { id: genre.id }
      end.to change(Genre, :count).by(-1)
    end
  end
end
