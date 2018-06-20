class AddDescriptionToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :description, :string
  end
end
