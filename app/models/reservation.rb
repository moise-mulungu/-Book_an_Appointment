class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  # validates :datetime, presence: true
end
