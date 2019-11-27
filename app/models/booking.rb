class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :fam
  has_many :reviews
  has_one :bookings_review

  validates :start_date, :end_date, :number_of_guests, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending accepted declined canceled) }
end
