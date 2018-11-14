class RenameMoodTripsToListings < ActiveRecord::Migration[5.2]
  def change
    rename_table :mood_trips, :listings
  end
end
