class User < ApplicationRecord
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
  LANGUAGES = %w(english french spanish chinese portuguese german italian russian arabic hebrew japanese korean indian)
  validates :language, inclusion: { in: LANGUAGES }
end
