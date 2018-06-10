class CreateMeetups < ActiveRecord::Migration[5.1]
  def change
    create_table :meetups do |t|
      t.string :name
      t.string :start_time
      t.string :integer
      t.integer :end_time

      t.timestamps
    end
  end
end
