class AddMeetupIdToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :meetup_id, :integer
  end
end
