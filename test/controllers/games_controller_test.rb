require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
    @user = user(:one)
  end

  test 'should get index' do
    get games_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_game_url
    assert_response :success
  end

  test 'should create game' do
    assert_difference('Game.count') do
      post user_games_url,
           params: { user: { id: @user.id }, game: { amount: @game.amount, name: @game.name, user_id: @user.id } }
    end

    assert_redirected_to game_url(@user, Game.last)
  end

  test 'should show game' do
    get game_url(@user, @game)
    assert_response :success
  end

  test 'should get edit' do
    get edit_game_url(@game)
    assert_response :success
  end

  test 'should update game' do
    patch game_url(@game), params: { game: { amount: @game.amount, name: @game.name, user_id: @user.id } }
    assert_redirected_to games_url(@user, @game)
  end

  test 'should destroy game' do
    assert_difference('Game.count', -1) do
      delete games_url(@user, @game)
    end

    assert_redirected_to user_games_url
  end
end
