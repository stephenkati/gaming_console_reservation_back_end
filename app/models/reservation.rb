class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :console
  validates :city, :reserve_date, presence: true
end
