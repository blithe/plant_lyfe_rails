require 'rails_spec_helper'

describe DicotsController do
    describe "#index" do
        before do
            get :index
        end

        it 'is successful' do
            expect(response).to be_success
        end

        it 'responds with plants' do
            expect(response.body).to include("plants")
        end
    end
end