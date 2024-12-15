class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit]
    def index
        @events = Event.all
    end

    def show
        @artists = @event.artists
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
        puts "0 -- #{event_params}"
        puts "1 -- #{event_params.dig("event_artists_attributes", "0", "artist", "name")}"

        artist_names = event_params.dig("event_artists_attributes")&.values&.map do |event_artist|
            event_artist.dig("artist", "name")
        end.reject(&:blank?)
          
        puts "2 -- #{artist_names.inspect}"
        puts "3 -- #{event_params[:event_artists_attributes]}"
        puts "4 -- #{event_params.dig("event_artists_attributes")}"
        puts "5 -- #{artist_names.empty?}"
        if artist_names.empty?
            @event = Event.new(event_params) 
        else 
            @event = Event.new(event_params.except(:event_artists_attributes))
        end

        if @event.save
            if artist_names.present?
                artist_names.each do |artist_name|
                  artist = Artist.fuzzy_search(:name, artist_name) || Artist.create(name: artist_name)
                  EventArtist.create(event: @event, artist: artist)  
                end
            end
            attach_saved_images
            redirect_to events_path, notice: 'Event was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
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
            :title, :url, :gallery_id, :visited_at, :start_date, :end_date, images: [],
            event_artists_attributes: [
                :id, :_destroy, 
                artist: [:id, :name, :_destroy]
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