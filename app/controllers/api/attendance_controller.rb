class Api::AttendancesController < ApplicationController
  def index
    @attendances = Attendance.where(user_id: current_user.id)
    render 'index.json.jbuilder' 
  end

  def create
    @attendance = Attendance.new(
                                  user_id: current_user.id,
                                  meetup_id: params[:meetup_id],
                                  status: "Going to attend"
                                )
  end

  def destroy
    attendance_id = params[:id]
    attendance = Attendance.find(attendance_id)
    attendance.update(status: "not attending")
    render json: {message: "You have left the meetup"}
  end
end
