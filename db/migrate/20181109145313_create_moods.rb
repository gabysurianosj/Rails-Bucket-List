class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
