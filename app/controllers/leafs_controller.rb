class LeafsController < ApplicationController

    def show
        @dicot = Dicot.friendly.find(params[:dicot_id])
        @leaf = @dicot.leafs.find(params[:id])
        render json: @leaf
    end

    def update
        @dicot = Dicot.friendly.find(params[:dicot_id])
        @leaf = @dicot.leafs.find(params[:id])
        if @leaf.update(leaf_params)
            render json: @leaf
        else
            render json: {errors: @leaf.errors}, status: :unprocessable_entity, serializer: FullDicotSerializer
        end
    end

    private

    def leaf_params
        params.permit(:placement, :blade, :veins, :location, :date_found)
    end
end
