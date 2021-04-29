# frozen_string_literal: true

class AddUserIdToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :user_id, :integer
  end
end
