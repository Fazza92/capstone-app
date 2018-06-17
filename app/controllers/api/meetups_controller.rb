class Api::MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all

    render 'index.json.jbuilder'
  end

  def show
    meetup_id = params[:id]
    @meetup = Meetup.find(meetup_id)
    render 'show.json.jbuilder'
  end

  def create
    @meetup = Meetup.new(
                            meetup_id: params[:meetup_id],
                            name: params[:name],
                            start_time: params[:start_time],
                            end_time: params[:end_time],
                            description: params[:description]

                          )
    @meetup.save
    render 'show.json.jbuilder'
  end

  def update
    created_meetup_id = params[:id]
    @meetup = Meetup.find(created_meetup_id)

    @meetup.name = params[:name] || @meetup.name
    @meetup.start_time = params[:start_time] || @meetup.start_time
    @meetup.end_time = params[:end_time] || @meetup.end_time
    @meetup.description = params[:description] || @meetup.description

    if @meetup.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @meetups.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    created_meetup_id = params[:id]
    @meetup = Meetup.find(created_meetup_id)
    @meetup.destroy
    render json: {message: "Meetup has been deleted"}
  end
end
