class Api::MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all

    render 'index.json.jbuilder'
  end

  def show
    created_meetup_id = params[:id]
    @meetup = Meetup.find(created_meetup_id)
    # puts "******************************"
    # puts "******************************"
    # p @meetup
    # puts "******************************"
    # puts "******************************"
    render 'show.json.jbuilder'
  end

  def create
    @meetup = Meetup.new(
                            meetup_id: params[:meetup_id],
                            name: params[:name],
                            start_name: params[:start_name],
                            end_time: params[:end_time]

                          )
    @meetup.save
    render 'show.json.jbuilder'
  end

  def update
    created_meetup_id = params[:id]
    @meetup = Meetup.find(created_meetup_id)

    @meetup.name = params[:name] || @meetup.name
    @meetup.start_name = params[:start_name] || @meetup.start_name
    @meetup.end_time = params[:end_time] || @meetup.end_time

    @product.save

    render 'show.json.jbuilder'
    
  end

  def destroy
    created_meetup_id = params[:id]
    @meetup = Meetup.find(created_meetup_id)
    @meetup.destroy
    render json: {message: "Meetup has been deleted"}
  end
end
