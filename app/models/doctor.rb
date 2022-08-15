class Doctor < ApplicationRecord
  has_many :reservations
  belongs_to :user
  validates :name, presence: true
  validates :speciality, presence: true
end
