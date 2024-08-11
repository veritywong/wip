class ActivitiesController < ApplicationController
    def index
        @activities = Activity.all
    end

    def show
        @activity = Activity.find(params[:id])
    end

    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.new(activity_params)
        if @activity.save
            redirect_to activity_path(@activity)
        else
            render :new
        end
    end

    def edit
        @activity = Activity.find(params[:id])
    end

    def update
        @activity = Activity.find(params[:id])
        if @activity.update(activity_params)
            # update_image_names
            attach_saved_images
            redirect_to activity_path(@activity)
        else
            render :edit
        end
    end

    private

    def activity_params
        params.require(:activity).permit(:name, images: [])
    end

    def update_image_names
        return unless params[:image_names]
        params[:image_names].each do |id, name|
            blob = ActiveStorage::Blob.find(id)
            blob.update!(filename: "#{name}.#{blob.filename.extension}")
        end
    end

    def attach_saved_images
        return unless params[:saved_images]

        params[:saved_images].each do |signed_id|
            @activity.images.attach(signed_id)
        end
    end
end