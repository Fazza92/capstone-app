class Meetup < ApplicationRecord
  belongs_to :events

  has_many :attendances
  has_many :users, through: :attendances
  
end
