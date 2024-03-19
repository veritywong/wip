class ExhibitionsController < ApplicationController
    def index
        @exhibitions = Exhibition.all
        @image = Installation.first.images.first
    end

    def show
        @exhibition = Exhibition.find(params[:id])
    end

end