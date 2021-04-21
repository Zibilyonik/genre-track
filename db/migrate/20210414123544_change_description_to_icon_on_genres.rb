# frozen_string_literal: true

class ChangeDescriptionToIconOnGenres < ActiveRecord::Migration[6.1]
  def change
    rename_column :genres, :description, :icon
  end
end
