class LocationsController < ApplicationController
  before_action :find_location, except: [:new, :create]

  def new
      @location = Location.new
      @cities = City.all
  end

  def create
      location = Location.new(location_params)
      if location.save
          redirect_to events_path
      else
          render :new, status: :unprocessable_entity
      end
  end

  def edit
      @cities = City.all
  end

  def update
      if @location.update
          redirect_to events_path
      else 
          render :new, status: :unprocessable_entity
      end
  end

  def search
    query = params[:q]
    results = PhotonService.new(query).geocode

    render json: results.map { |result|
      {
        name: result[:name],
        street: result[:street],
        city: result[:city]
      }
    }
  end
  
  private

  def location_params
      params.require(:location).permit(:city_id, :name, :organisation, :website, :address_line_1, :postcode)
  end

  def find_location
      @location = Location.find(params[:id])
  end
end