class Doctor < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :specialty, presence: true
end
