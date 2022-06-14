class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid
    def index
        signups = Signup.all
        render json: signups
    end

    def show
        signup = Signup.find(params[:id])
        render json: signup
    end

    def create
        signup = Signup.create!(signup_params)
        render json: signup
    end

    private

    def invalid
        render json: { error: ['validation errors']}
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
