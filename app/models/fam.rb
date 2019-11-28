class Fam < ApplicationRecord
  LANGUAGES = %w(english french spanish chinese portuguese german italian russian arabic hebrew japanese korean indian)
  HOUSING = %w(house apartment castle farm camper tent houseboat treehouse)
  CAPACITY = %w(1 2 3 4 5 6 7 8 9 10)

  belongs_to :user
  has_many :bookings
  has_many :bookings_reviews, through: :bookings
  has_many :pictures, dependent: :destroy
  # has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { in: 6..500 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :housing_type, presence: true, inclusion: { in: HOUSING }
  validates :language, presence: true
  validates :cultural_experience, presence: true
  validates :location, presence: true
  validates :capacity, presence: true, inclusion: { in: CAPACITY }
  validates :members, presence: true, numericality: { greater_than: 0 }

  # validates :pictures, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
