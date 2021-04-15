class Genre < ApplicationRecord
  belongs_to :user
  has_many :genre_games
  has_many :games, through: :genre_games, dependent: :destroy
  validates :name, presence: true
end
