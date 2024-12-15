class GalleryEventsController < ApplicationController
    before_action :find_gallery_event, only: [:update, :schedule]

    def index
        @gallery_events = Galleryevent.all
    end
    def update
        @gallery_event.update(gallery_event_params)
        redirect_to root_path
    end

    def schedule
        
    end

    private
    def find_gallery_event
        @gallery_event = Galleryevent.find(params[:id])
    end

    def gallery_event_params
        params.require(:gallery_event).permit(:start_date, :end_date)
    end
end