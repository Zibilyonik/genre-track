require 'rails_helper'
require './spec/support/session_helpers'
RSpec.describe GamesController, type: :controller do
  describe 'GET index' do
    it 'should get index' do
      user = create(:user)
      log_in(user)
      get :index, params: { user_id: user.id }
      should render_template('index')
    end
  end

  describe 'GET show' do
    it 'should get show' do
      user = create(:user)
      game = create(:game)
      log_in(user)
      get :show, params: { id: game.id, user_id: user.id }
      should render_template('show')
    end
  end

  describe 'DELETE destroy' do
    it 'should delete the game' do
      user = create(:user)
      game = create(:game, user_id: user.id)
      log_in(user)
      expect do
        delete :destroy, params: { id: game.id, user_id: user.id }
      end.to change(Game, :count).by(-1)
    end
  end
end
