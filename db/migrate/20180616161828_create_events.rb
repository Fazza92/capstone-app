class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.string :name
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
