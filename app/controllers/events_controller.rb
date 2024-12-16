class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update]
    def index
        @events = Event.all
    end

    def show
        @artists = @event.artists
        @images = @event.images
        @event.event_artists.build.build_artist if @event.event_artists.empty?
    end

    def edit
    end

    def new
        @event = Event.new
        @event.event_artists.build.build_artist
        # @event.artists.build
    end

    def create
        artist_names = event_params[:event_artists_attributes]&.values&.map do |event_artist|
            event_artist[:artist]
        end.reject(&:blank?)
 
        @event = Event.new(event_params.except(:event_artists_attributes))       

        if @event.save
            if artist_names.present?
                artist_names.each do |artist_name|
                  artist = Artist.fuzzy_search(:name, artist_name) || Artist.create(name: artist_name)
                  EventArtist.create(event: @event, artist: artist)  
                end
            end
            # attach_saved_images
            redirect_to events_path, notice: 'Event was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @event.update(event_params.except(:event_artists_attributes))
            redirect_to event_path(@event), notice: 'Event was successfully update.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def attach_saved_images
        return unless params[:saved_images]
        params[:saved_images].each do |signed_id|
            @event.images.attach(signed_id)
        end
    end

    private

    def find_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(
            :title, :url, :location_id, :visited_at, :start_date, :end_date, images: [],
            event_artists_attributes: [
                :id, :artist, :_destroy
            ]
            )
    end

    def update_image_names
        return unless params[:image_names]
        params[:image_names].each do |id, name|
            blob = ActiveStorage::Blob.find(id)
            blob.update!(filename: "#{name}.#{blob.filename.extension}")
        end
    end

end