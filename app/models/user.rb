class User < ApplicationRecord
   has_secure_password

   has_many :meetup

   validates :email, presence: true
   validates :email, uniqueness: true
   validates :name, presence: true
end
