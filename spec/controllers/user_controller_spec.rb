require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe 'GET show' do
    it 'should get show' do
      user = create(:user)
      log_in(user)
      get :show, params: { id: user.id }
      should render_template('show')
    end
  end

  describe 'DELETE destroy' do
    it 'should delete the game' do
      user = create(:user)
      log_in(user)
      expect do
        delete :destroy, params: { id: user.id }
      end.to change(User, :count).by(-1)
    end
  end

  describe 'redirect to login' do
    it 'should redirect guest users' do
      get :show, params: { id: '1'}
      should redirect_to('/login')
    end
  end
end
