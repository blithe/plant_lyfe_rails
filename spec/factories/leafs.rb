FactoryGirl.define do
    factory :leaf do
        dicot

        sequence(:placement)   { |n| "opposite #{n}" }
        sequence(:blade)       { |n| "palmately compound #{n}" }
        sequence(:veins)       { |n| "penniveined #{n}" }
        sequence(:location)    { |n| "Vancouver, BC #{n}" }
        sequence(:date_found)  { |n| "20#{n}-01-01" }
    end
end
