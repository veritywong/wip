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

    private

    def activity_params
        params.require(:activity).permit(:name, images: [])
    end
end