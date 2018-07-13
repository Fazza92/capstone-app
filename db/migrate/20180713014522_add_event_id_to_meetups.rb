class AddEventIdToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :event_id, :integer
  end
end
