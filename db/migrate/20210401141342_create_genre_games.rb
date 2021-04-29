# frozen_string_literal: true

class CreateGenreGames < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_games do |t|
      t.references :game, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
