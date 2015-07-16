class DicotsController < ApplicationController
    def index
        @plants = Dicot.all
        render json: {"plants": @plants}
    end
end
