class ExhibitionsController < ApplicationController
    def index
        @exhibitions = Exhibition.all
    end

    def show
        
    end
end