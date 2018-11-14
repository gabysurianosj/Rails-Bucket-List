class Trip < ApplicationRecord
  has_many :listings
  has_many :todolists, through: :listings
  has_many :users, through: :listings
  has_many :trip_categories
  has_many :categories, through: :trip_categories
  belongs_to :country

  validates :title, presence: true, uniqueness: { scope: :country_id } # Validates uniqueness of title and channel
  #validates :season, presence: true, uniqueness: { greater_than: 0 }

  scope :search, -> (query) { where("title LIKE ?", "%" + query + "%") }
  #scope :behind_on, -> (user_id) { joins(:listings).where('trips.season > listings.user_season').where(listings: {user_id: user_id}).uniq }

  def country_attributes=(country_attributes)
    country_attributes.values.each do |country_attribute|
      unless country_attribute.blank?
        country = Country.find_or_create_by(name: country_attribute)
        self.country = country
      end
    end
  end

  def categories_attributes=(categories_attributes)
    category_name = category_attributes["0"]["name"]
    unless category_name.blank?
      category = Category.find_or_create_by(name: category_name)
      self.categories << category
    end
  end

  def trips_todolists_by_user(user_id)
    self.listings.where(user_id: user_id)
  end
end
