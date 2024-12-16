class LocationEventsController < ApplicationController
    before_action :find_location_event, only: [:update, :schedule]

    def index
        @location_events = LocationEvent.all
    end
    def update
        @location_event.update(location_event_params)
        redirect_to root_path
    end

    def schedule
        
    end

    private
    def find_location_event
        @location_event = LocationEvent.find(params[:id])
    end

    def location_event_params
        params.require(:location_event).permit(:start_date, :end_date)
    end
end