class RenameCountryColumnandChangeTypeTrips < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :country, :country_id
    change_column :trips, :country_id, :integer
    change_column :mood_trips, :user_season, :integer
    remove_column :trips, :category
  end
end
