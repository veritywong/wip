class GalleriesController < ApplicationController
    def new
        @gallery = Gallery.new
        @cities = City.all
    end

    def create
        gallery = Gallery.new(gallery_params)
        if gallery.save
            redirect_to exhibitions_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def gallery_params
        params.require(:gallery).permit(:city_id, :name, :organisation, :website, :address_line_1, :postcode, :type)
    end
end