class User < ApplicationRecord
  has_many :games
  has_many :genres
end
