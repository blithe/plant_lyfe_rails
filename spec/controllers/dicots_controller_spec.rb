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
            expect(plants.first["species"]).to eq(dicot1.species)

            expect(plants.last["common_name"]).to eq(dicot2.common_name)
            expect(plants.last["species"]).to eq(dicot2.species)
        end
    end

    describe "#show" do
        let!(:dicot) { FactoryGirl.create(:dicot) }
        before do
            get :show, id: dicot.id
        end

        it 'is successful' do
            expect(response).to be_success
        end

        it "returns a representation of the dicot" do
            plant = JSON.parse(response.body)

            expect(plant["id"]).to eq("plant-#{dicot.id}")
            expect(plant["common_name"]).to eq(dicot.common_name)
            expect(plant["subclass"]).to eq(dicot.subclass)
            expect(plant["order"]).to eq(dicot.order)
            expect(plant["family"]).to eq(dicot.family)
            expect(plant["genus"]).to eq(dicot.genus)
            expect(plant["species"]).to eq(dicot.species)
        end
    end
end
