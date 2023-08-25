class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :console
  validates :city, :reserve_date, presence: true
  validate :reserve_date_cannot_be_in_the_past

  def reserve_date_cannot_be_in_the_past
    return unless reserve_date.present? && reserve_date < Date.today

    errors.add(:reserve_date, "can't be in the past")
  end
end
