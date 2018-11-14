class User < ApplicationRecord
  has_many :todolists
  has_many :listings
  has_many :trips, through: :listings

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  has_secure_password

  def favorite_trips
    # List the user's shows where fav is true
    self.trips.includes(:listings).where(:listings => { fav: true }).uniq
  end
end
