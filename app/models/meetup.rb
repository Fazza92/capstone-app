class Meetup < ApplicationRecord
  belongs_to :events

  has_many :users
  has_many :attendances
  
end
