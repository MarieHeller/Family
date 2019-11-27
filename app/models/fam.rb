class Fam < ApplicationRecord
  LANGUAGES = %w(english french spanish chinese portuguese german italian russian arabic hebrew japanese korean indian)
  HOUSING = %w(house apartment castle farm camper tent houseboat treehouse)
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :pictures, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { in: 6..500 }
  validates :price, presence: true
  validates :housing_type, presence: true, inclusion: { in: HOUSING }
  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :cultural_experience, presence: true
  validates :location, presence: true
  # validates :pictures, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

