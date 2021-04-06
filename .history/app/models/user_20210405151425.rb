class User < ApplicationRecord
  has_many :games
  has_many :genres
  before_save {self.email - email.downcase}
  validates :name, presence: true
end
