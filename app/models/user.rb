class User < ApplicationRecord
  LANGUAGES = %w(english french spanish chinese portuguese german italian russian arabic hebrew japanese korean indian)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :fams
  has_many :bookings
  # has_many :booked_families, through: :bookings, source: :fams

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, length: { in: 50..300 }
  validates :language, inclusion: { in: LANGUAGES }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }

end
