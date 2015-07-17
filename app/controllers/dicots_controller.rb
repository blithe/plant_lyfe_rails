class DicotsController < ApplicationController
    def index
        @dicots = Dicot.all
        render json: @dicots, root: "plants"
    end
end
