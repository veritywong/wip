class LocationsController < ApplicationController
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
end
  