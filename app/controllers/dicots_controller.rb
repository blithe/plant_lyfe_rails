class DicotsController < ApplicationController
    def index
        @dicots = Dicot.all
        render json: @dicots, root: "plants"
    end

    def show
        @dicot = Dicot.friendly.find(params[:id])
        render json: @dicot, serializer: FullDicotSerializer
    end
end
