class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_record

    def index
        activities = Activity.all
        render json: activities
    end

    def show
        activity = Activity.find(params[:id])
        render json: activity
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy!
        render json: status: 204
    end

    private
    def no_record
        render json: { error: 'Activity not found'}
    end
end
