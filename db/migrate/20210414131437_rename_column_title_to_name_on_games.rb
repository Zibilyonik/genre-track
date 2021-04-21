# frozen_string_literal: true

class RenameColumnTitleToNameOnGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :title, :name
  end
end
