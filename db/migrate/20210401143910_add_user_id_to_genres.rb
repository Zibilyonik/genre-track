# frozen_string_literal: true

class AddUserIdToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :user_id, :integer
  end
end
