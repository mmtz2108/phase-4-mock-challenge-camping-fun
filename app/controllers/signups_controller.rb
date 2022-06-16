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
        render json: signup.activity, status: 201
    end

    private

    def invalid
        render json: { errors: errorobj.record.errors.full_messages} , status: 422
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
