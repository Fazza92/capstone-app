class Meetup < ApplicationRecord
  belongs_to :event, optional: true

  has_many :attendances
  has_many :users, through: :attendances
  
end
