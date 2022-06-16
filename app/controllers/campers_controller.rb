class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_record
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitySerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: 201
    end

    private

    def no_record
        render json: { error: 'Camper not found'}, status: 404
    end

    def invalid(errorobj)
        render json: { errors: errorobj.record.errors.full_messages} , status: 422
    end

    def camper_params
        params.permit(:name, :age)
    end
end
