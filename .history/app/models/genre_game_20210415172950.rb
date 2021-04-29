class GenreGame < ApplicationRecord
  belongs_to :game, dependent: :destroy
  belongs_to :genre, dependent: :destroy
end
