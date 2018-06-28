class User < ApplicationRecord
   has_secure_password

   has_many :attendances   
   has_many :meetups, through: :attendances

   validates :email, presence: true
   validates :email, uniqueness: true
   validates :name, presence: true
end
