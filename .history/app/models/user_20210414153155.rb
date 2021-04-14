class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :genres, dependent: :destroy
  before_save { self.name = name.downcase }
  validates :name, presence: true, case_sensitive: false
end
