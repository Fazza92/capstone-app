class Meetup < ApplicationRecord
  belongs_to :event

  has_many :attendances
  has_many :users, through: :attendances
  
end
