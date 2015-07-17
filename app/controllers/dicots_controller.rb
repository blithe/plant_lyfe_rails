class DicotsController < ApplicationController
    def index
        @dicots = Dicot.all
        render json: @dicots, root: "plants"
    end

    def show
        @dicot = Dicot.friendly.find(params[:id])
        render json: @dicot, serializer: FullDicotSerializer
    end

    def create
        @dicot = Dicot.new(dicot_params)
        if @dicot.save
            render json: @dicot, status: 201, serializer: FullDicotSerializer
        else
            render json: {errors: @dicot.errors}, status: :unprocessable_entity, serializer: FullDicotSerializer
        end
    end

    private

    def dicot_params
        params.permit(:common_name, :subclass, :order, :family, :genus, :species)
    end
end
