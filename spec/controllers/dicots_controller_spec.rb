require 'rails_spec_helper'

describe DicotsController do
    describe "#index" do
        let!(:dicot1) { FactoryGirl.create(:dicot) }
        let!(:dicot2) { FactoryGirl.create(:dicot) }
        before do
            get :index
        end

        it 'is successful' do
            expect(response).to be_success
        end

        it 'responds with plants' do
            expect(response.body).to include("plants")
        end

        it "returns a list of all dicots" do
            plants = JSON.parse(response.body)["plants"]
            expect(plants.first["common_name"]).to eq(dicot1.common_name)
            expect(plants.last["common_name"]).to eq(dicot2.common_name)
        end
    end
end
