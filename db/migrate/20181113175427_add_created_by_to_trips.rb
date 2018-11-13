class AddCreatedByToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :created_by, :integer
  end
end
