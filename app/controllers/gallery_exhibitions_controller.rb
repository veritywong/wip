class GalleryExhibitionsController < ApplicationController
    def schedule
        @gallery_exhibition = GalleryExhibition.find(params[:id])
    end
end