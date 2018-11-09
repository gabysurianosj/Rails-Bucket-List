class Listing < ApplicationRecord
  belongs_to :todolist
  belongs_to :trip
  belongs_to :user

  validates :user_season, presence: true, numericality: { greater_than: 0 }
  validates :todolist_id, uniqueness: { scope: :trip_id }, :on => :create
  #validate :user_season_vs_season

  #def user_season_vs_season
  #  if user_season.present? && user_season > show.current_season
  #    errors.add(:user_season, "can't be ahead of the show's Season #{show.current_season}")
  #  end
  #end
end
