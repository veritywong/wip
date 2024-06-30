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
        @exhibition.gallery_exhibitions.build
        @exhibition.galleries.build
    end

    def visited_and_new
        @exhibition = Exhibition.new
        @exhibition.gallery_exhibitions.build
        @exhibition.galleries.build
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

        @exhibition = Exhibition.new(exhibition_params.except(:galleries_attributes))

        gallery = Gallery.fuzzy_search(:name, exhibition_params[:galleries_attributes]['0'][:name])
        new_gallery = Gallery.new(exhibition_params[:galleries_attributes]['0']) unless gallery

        if @exhibition.save && (gallery || new_gallery.save)
            # ExhibitionArtist.create(exhibition: @exhibition, artist: artist) unless artist.nil?
            @gallery_exhibition = GalleryExhibition.create(exhibition: @exhibition, gallery: (gallery || new_gallery))
            redirect_to schedule_gallery_exhibition_path(@gallery_exhibition)
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
            :title, :url, 
            galleries_attributes: [:name, :city_id, :type]
            # gallery_exhibitions_attributes: [:id, :gallery_id, :start_date, :end_date],
            # artists_attributes: [:name]
            )
    end

end