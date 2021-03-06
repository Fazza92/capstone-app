class Api::EventsController < ApplicationController
  def index
    @events = Event.all

    render 'index.json.jbuilder'
  end

  def show
    event_id = params[:id]
    @event = Event.find(event_id)
    render 'show.json.jbuilder'
  end

  def create
    @event = Event.new(
                             name: params[:name],
                             location: params[:location],
                             description: params[:description]
                            )

      if @event.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity
      end
    
  end

  def update
    event_id = params[:id]
    @event = Event.find(event_id)

    @event.name = params[:name] || @event.name
    @event.location = params[:location] || @event.location
    @event.description = params[:description] || @event.description
    
    if @event.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    event_id = params[:id]
    @event = Event.find(event_id)
    @event.destroy
    render json: {message: "Event successfully destroyed"}
  end
end
