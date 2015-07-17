class LeafsController < ApplicationController

    def show
        @dicot = Dicot.friendly.find(params[:dicot_id])
        @leaf = @dicot.leafs.find(params[:id])
        render json: @leaf
    end
end
