class Game < ApplicationRecord
  belongs_to :user
  has_many :genre_games
  has_many :genres, through: :genre_games
end
