class User < ApplicationRecord
  has_many :games
  has_many :genres
  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
