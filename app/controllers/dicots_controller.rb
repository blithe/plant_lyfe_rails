class DicotsController < ApplicationController
    def index
        @plants = []
        render json: {"plants": @plants}
    end
end