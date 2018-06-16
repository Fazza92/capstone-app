class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end
