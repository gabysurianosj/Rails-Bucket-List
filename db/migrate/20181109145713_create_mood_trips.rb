class CreateMoodTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :mood_trips do |t|
      t.integer :mood_id
      t.integer :trip_id
      t.integer :user_id
      t.string :user_status
      t.string :user_season
      t.timestamps
    end
  end
end
