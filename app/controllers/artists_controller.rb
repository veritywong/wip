class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit]
    def index
        @artists = Artist.all
    end

    def show
        @image = @artist.images.first # if @artist.images.any?
    end

    def edit
    end

    def update

    end

    private
    
    def find_artist
        @artist = Artist.find(params[:id])
    end
end