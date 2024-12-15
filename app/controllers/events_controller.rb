class EventsController < ApplicationController
    def index
        @events = event.all
    end

    def show
        @event = event.find(params[:id])
        @artists = @event.artists
    end

    def edit
        @event = event.find(params[:id])
    end

    def new
        @event = event.new
    end

    def visited_and_new
        @event = event.new
        # @event.event_artists.build
        # @event.artists.build
    end

    def create
        # artist = Artist.fuzzy_search(:name, event_params[:artists_attributes]['0'][:name])
        # if artist.nil?
        #     @event = event.new(event_params) 
        # else 
        #     @event = event.new(event_params.except(:artists_attributes))
        # end

        @event = event.new(event_params)

        if @event.save
            # eventArtist.create(event: @event, artist: artist) unless artist.nil?
            redirect_to events_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
    end

    def schedule
        @event = event.find(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(
            :title, :url, :gallery_id, :start_date, :end_date
            # artists_attributes: [:name]
            )
    end

end