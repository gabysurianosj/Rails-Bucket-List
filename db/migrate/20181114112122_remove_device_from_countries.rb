class RemoveDeviceFromCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :countries, :device
    remove_column :trips, :status
    remove_column :trips, :fav
    remove_column :trips, :admin
    add_column :listings, :fav, :boolean, default: false
  end
end
