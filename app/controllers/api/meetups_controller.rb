class Api::MeetupsController < ApplicationController
  def index
    @meetup = Meetup.all

    render 'index.json.jbuilder'
  end

  def show
    render 'show.json.jbuilder'
  end

  def create
    @meetup = Meetup.new(
                            name: params[:name],
                            start_name: params[:start_name],
                            end_time: params[:end_time]

                          )
    @meetup.save
    render 'show.json.jbuilder'
  end
end
