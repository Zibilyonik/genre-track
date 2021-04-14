class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :genres, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
