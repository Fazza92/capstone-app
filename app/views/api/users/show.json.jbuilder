json.id @user.id
json.name @user.name
json.email @user.email

json.meetups do
  json.array! @user.meetups, partial: 'api/meetups/meetup', as: :meetup
end