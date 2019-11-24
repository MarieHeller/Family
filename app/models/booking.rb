class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :fam
  has_many :reviews

  validates :start_date, :end_date, :number_of_guests, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending accepted rejected canceled) }
end
