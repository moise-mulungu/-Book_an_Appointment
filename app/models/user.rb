class User < ApplicationRecord
  has_many :reservations
  has_many :doctors
  has_many :doctors_reservations, through: :reservations, source: :user

  validates :username, presence: true, uniqueness: true
end
