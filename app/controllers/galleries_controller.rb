class GalleriesController < ApplicationController
    before_action :find_gallery, except: [:new, :create]

    def new
        @gallery = Gallery.new
        @cities = City.all
    end

    def create
        gallery = Gallery.new(gallery_params)
        if gallery.save
            redirect_to events_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @cities = City.all
    end

    def update
        if @gallery.update
            redirect_to events_path
        else 
            render :new, status: :unprocessable_entity
        end
    end

    private

    def gallery_params
        params.require(:gallery).permit(:city_id, :name, :organisation, :website, :address_line_1, :postcode)
    end

    def find_gallery
        @gallery = Gallery.find(params[:id])
    end
end