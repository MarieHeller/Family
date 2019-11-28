class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :fam
  has_many :bookings_reviews, dependent: :destroy

  validates :start_date, :end_date, :number_of_guests, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending accepted declined canceled) }
  validates :number_of_guests, presence: true, numericality: { greater_than: 0 }
end
