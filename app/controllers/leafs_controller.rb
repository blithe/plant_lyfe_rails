class LeafsController < ApplicationController

    def create
        @dicot = Dicot.friendly.find(params[:dicot_id])
        @leaf = @dicot.leafs.new(leaf_params)
        if @leaf.save
            render json: @leaf, status: 201
        else
            render json: {errors: @leaf.errors}, status: :unprocessable_entity
        end
    end

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

    def destroy
        @dicot = Dicot.friendly.find(params[:dicot_id])
        @leaf = @dicot.leafs.find(params[:id])
        @leaf.destroy
        head :no_content
    end

    private

    def leaf_params
        params.permit(:placement, :blade, :veins, :location, :date_found)
    end
end
