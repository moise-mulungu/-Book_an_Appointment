class User < ApplicationRecord
  has_many :reservations
  has_many :doctors
  has_many :doctors, through: :reservations

  validates :username, presence: true, uniqueness: true
end
