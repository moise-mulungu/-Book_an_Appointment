class Doctor < ApplicationRecord
  has_many :reservations
  has_belongs_to :user
  validates :name, presence: true
  validates :specialty, presence: true
end
