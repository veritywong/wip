class ExhibitionsController < ApplicationController
    def index
        @exhibitions = Exhibition.all
    end

    def show
        @exhibition = Exhibition.find(params[:id])
    end

    def new
        @exhibition = Exhibition.new
        @exhibition.gallery_exhibitions.build
        @exhibition.exhibition_artists.build
        @exhibition.artists.build
    end

    def create
        # search for artist, and if that artist exists create a new 'exhibition_artist' otherwise create artist and then the association
        puts "1 -- #{exhibition_params}"
        @exhibition = Exhibition.new(exhibition_params)
        if @exhibition.save
            redirect_to exhibitions_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
    end

    private

    def exhibition_params
        params.require(:exhibition).permit(
            :title, :url, 
            gallery_exhibitions_attributes: [:id, :gallery_id, :start_date, :end_date],
            exhibition_artists_attributes: [:id, :artist_id],
            artists_attributes: [:name]
            )
    end

end