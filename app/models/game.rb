class Game < ApplicationRecord
  belongs_to :user
  has_many :genre_games, dependent: :destroy
  has_many :genres, through: :genre_games
  validates :name, presence: true
  scope :external, -> { includes(:genres).where(genres: { id: nil }) }
end
