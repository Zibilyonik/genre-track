# frozen_string_literal: true

class RemoveDeveloperFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :developer, :text
  end
end
