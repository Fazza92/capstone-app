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
                            name: params[:name],
                            start_time: params[:start_time],
                            end_time: params[:end_time],
                            description: params[:description],
                            integer: '1'
                          )
    @meetup.save
    
    render 'show.json.jbuilder'
  end

    def update
      meetup_id = params[:id]
      @meetup = Meetup.find(meetup_id)
      
      @meetup.name = params[:name] || @meetup.name
      @meetup.start_time = params[:start_time] || @meetup.start_time
      @meetup.end_time = params[:end_time] || @meetup.end_time
      @meetup.description = params[:description] || @meetup.description
      @meetup.integer = @meetup.integer
      
      if @meetup.save
        render 'show.json.jbuilder'
      else
        puts "***********************************"
        p @meetup.errors.full_messages
        puts "***********************************"
        render json: {errors: @meetup.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      meetup_id = params[:id]
      @meetup = Location.find(meetup_id)
      @meetup.destroy
      render json: {message: "Meetup successfully destroyed"}
    end
  end

