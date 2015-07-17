require 'rails_spec_helper'

describe LeafsController do
    describe "#create" do
        let!(:dicot) { FactoryGirl.create(:dicot) }
        let!(:leaf_attributes) { AttributesFor(:leaf) }
        before do
            slug = dicot.common_name.downcase.strip.gsub(' ', '-')
            put :create, leaf_attributes, dicot_id: slug
        end

        it 'is successful' do
            expect(response).to have_http_status(:created)
        end

        it "returns a representation of the leaf" do
            json = JSON.parse(response.body)

            expect(json["placement"]).to eq(leaf_attributes["placement"])
            expect(json["blade"]).to eq(leaf_attributes["blade"])
            expect(json["veins"]).to eq(leaf_attributes["veins"])
            expect(json["location"]).to eq(leaf_attributes["location"])
            expect(json["date_found"]).to eq(leaf_attributes["date_found"].strftime("%Y-%m-%d"))
        end
    end

    describe "#show" do
        let!(:leaf) { FactoryGirl.create(:leaf) }
        before do
            slug = leaf.dicot.common_name.downcase.strip.gsub(' ', '-')
            get :show, dicot_id: slug, id: leaf.id
        end

        it 'is successful' do
            expect(response).to be_success
        end

        it "returns a representation of the leaf" do
            json = JSON.parse(response.body)

            expect(json["id"]).to eq("leaf-#{leaf.id}")
            expect(json["plant"]).to eq("plant-#{leaf.dicot.id}")
            expect(json["placement"]).to eq(leaf.placement)
            expect(json["blade"]).to eq(leaf.blade)
            expect(json["veins"]).to eq(leaf.veins)
            expect(json["location"]).to eq(leaf.location)
            expect(json["date_found"]).to eq(leaf.date_found.strftime("%Y-%m-%d"))
        end
    end

    describe "#update" do
        let!(:leaf) { FactoryGirl.create(:leaf) }
        before do
            slug = leaf.dicot.common_name.downcase.strip.gsub(' ', '-')
            post :update, dicot_id: slug, id: leaf.id, placement: "new placement"
        end

        it 'is successful' do
            expect(response).to be_success
        end

        it "returns a representation of the leaf" do
            json = JSON.parse(response.body)

            expect(json["id"]).to eq("leaf-#{leaf.id}")
            expect(json["plant"]).to eq("plant-#{leaf.dicot.id}")
            expect(json["placement"]).to eq("new placement")
            expect(json["blade"]).to eq(leaf.blade)
            expect(json["veins"]).to eq(leaf.veins)
            expect(json["location"]).to eq(leaf.location)
            expect(json["date_found"]).to eq(leaf.date_found.strftime("%Y-%m-%d"))
        end
    end

    describe "#destroy" do
        let!(:leaf) { FactoryGirl.create(:leaf) }
        before do
            slug = leaf.dicot.common_name.downcase.strip.gsub(' ', '-')
            delete :destroy, dicot_id: slug, id: leaf.id
        end

        it 'is successful' do
            expect(response.status).to eq(204)
        end

        it 'deletes the leaf' do
            expect {
              Leaf.find(leaf.id)
            }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end
end
