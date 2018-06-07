class Api::MeetupsController < ApplicationController
  def index
    @meetup = Meetup.all

    render 'index.json.jbuilder'
  end

  def show
    render 'show.json.jbuilder'
  end
end
