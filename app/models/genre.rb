class Genre < ApplicationRecord
  belongs_to :user
  has_many :genre_games, dependent: :destroy
  has_many :games, through: :genre_games
  validates :name, presence: true
end
