class ExhibitionsController < ApplicationController
    def index
        @exhibitions = Exhibition.all
    end

    def show
        @exhibition = Exhibition.find(params[:id])
        @artists = @exhibition.artists
    end

    def edit
        @exhibition = Exhibition.find(params[:id])
    end

    def new
        @exhibition = Exhibition.new
    end

    def visited_and_new
        @exhibition = Exhibition.new
        # @exhibition.exhibition_artists.build
        # @exhibition.artists.build
    end

    def create
        # artist = Artist.fuzzy_search(:name, exhibition_params[:artists_attributes]['0'][:name])
        # if artist.nil?
        #     @exhibition = Exhibition.new(exhibition_params) 
        # else 
        #     @exhibition = Exhibition.new(exhibition_params.except(:artists_attributes))
        # end

        @exhibition = Exhibition.new(exhibition_params)

        if @exhibition.save
            # ExhibitionArtist.create(exhibition: @exhibition, artist: artist) unless artist.nil?
            redirect_to exhibitions_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
    end

    def schedule
        @exhibition = Exhibition.find(params[:id])
    end

    private

    def exhibition_params
        params.require(:exhibition).permit(
            :title, :url, :gallery_id, :start_date, :end_date
            # artists_attributes: [:name]
            )
    end

end