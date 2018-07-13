class RemoveMeetupIdFromMeetups < ActiveRecord::Migration[5.1]
  def change
    remove_column :meetups, :meetup_id, :integer
  end
end
