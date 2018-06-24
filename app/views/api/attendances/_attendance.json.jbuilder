json.id attendance.id
json.user_id attendance.user_id
json.meetup_id attendance.meetup_id

json.attendance do
  json.partial! attendance.attendance, partial: 'api/attendances/attendance', as: :attendance
end

json.status attendance.status