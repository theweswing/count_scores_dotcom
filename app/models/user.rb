class User < ApplicationRecord
  has_many :players
  has_many :matches, through: :players
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
