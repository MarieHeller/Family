class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :families
  has_many :booked_families, through: :bookings, source: :families

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, length: { in: 50..300 }
  LANGUAGES = %w(english french spanish chinese portuguese german italian russian arabic hebrew japanese korean indian)
  validates :languges, inclusion: { in: LANGUAGES }

end
