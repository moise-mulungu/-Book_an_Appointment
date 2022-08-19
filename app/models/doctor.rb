class Doctor < ApplicationRecord
  has_many :reservations
  belongs_to :user
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :speciality, presence: true
  validates :bill, presence: true
  validates :image, presence: true
  validates :location, presence: true
  validates :email, presence: true
end
