class GalleryExhibitionsController < ApplicationController
    before_action :find_gallery_exhibition, only: [:update, :schedule]

    def index
        @gallery_exhibitions = GalleryExhibition.all
    end
    def update
        @gallery_exhibition.update(gallery_exhibition_params)
        redirect_to root_path
    end

    def schedule
        
    end

    private
    def find_gallery_exhibition
        @gallery_exhibition = GalleryExhibition.find(params[:id])
    end

    def gallery_exhibition_params
        params.require(:gallery_exhibition).permit(:start_date, :end_date)
    end
end