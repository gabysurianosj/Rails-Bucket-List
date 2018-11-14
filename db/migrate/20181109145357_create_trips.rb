class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :country
      t.string :status
      t.string :day
      t.string :time
      t.string :season
      t.boolean :fav, default: false
       t.timestamps
    end
  end
end
