class CollectionsController < ApplicationController
    before_action :find_collection, only: %i{show edit}
    def show
    end

    def edit
    end

    def update
        @collection = Collection.find(params[:id])
        if @collection.update(collection_params)
            redirect_to collection_path(@collection)
        else
            render :edit
        end
    end

    
    private

    def collection_params
        params.require(:collection).permit(items_attributes: [:id, :_destroy, :content])
    end

    def find_collection
        @collection = Collection.find(params[:id])
    end
end