require 'rails_spec_helper'

describe LeafsController do
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
end
