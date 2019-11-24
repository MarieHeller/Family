class Fam < ApplicationRecord
  LANGUAGES = %w(english french spanish chinese portuguese german italian russian arabic hebrew japanese korean indian)
  HOUSING = %w(house apartment castle farm camper tent houseboat treehouse)
  belongs_to :user
  belongs_to
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true, length: { in: 6..500 }
  validates :price, presence: true
  validates :housing_type, presence: true, inclusion: { in: HOUSING }
  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :cultural_experience, presence: true
  validates :location, presence: true
  validates :photos, presence: true
end

