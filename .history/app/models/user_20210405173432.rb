class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :genres, dependent: :destroy
  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
