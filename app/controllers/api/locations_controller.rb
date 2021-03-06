class Api::LocationsController < ApplicationController
  def index
    @locations = Location.all

    render 'index.json.jbuilder'
  end

  def show
    location_id = params[:id]
    @location = Location.find(location_id)
    render 'show.json.jbuilder'
  end

  def create
    @location = Location.new(
                             name: params[:name],
                             longitude: params[:longitude],
                             latitude: params[:latitude]
                            )

      if @location.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @location.errors.full_messages}, status: :unprocessable_entity
      end
    # else
    #   render json: {}, status: :unauthorized
  end

    def update
    location_id = params[:id]
    @location = Location.find(location_id)
    
    @location.name = params[:name] || @location.name
    @location.longitude = params[:longitude] || @location.longitude
    @location.latitude = params[:latitude] || @location.latitude
    
    if @location.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @location.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    location_id = params[:id]
    @location = Location.find(location_id)
    @location.destroy
    render json: {message: "Location successfully destroyed"}
  end
end

