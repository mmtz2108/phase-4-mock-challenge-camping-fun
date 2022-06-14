class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_record
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper
    end

    private

    def no_record
        render json: { error: 'Camper not found'}
    end

    def invalid
        render json: { error: ['validation errors']}
    end

    def camper_params
        params.permit(:name, :age)
    end
end
