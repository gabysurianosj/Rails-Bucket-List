class RenameMoodsToTodolists < ActiveRecord::Migration[5.2]
  def change
    rename_table :moods, :todolists
    rename_column :listings, :mood_id, :todolist_id
  end
end
