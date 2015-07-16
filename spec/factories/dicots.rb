FactoryGirl.define do
    factory :dicot do
        sequence(:common_name) { |n| "bigleaf maple #{n}" }
        sequence(:subclass)    { |n| "Rosidae #{n}" }
        sequence(:order)       { |n| "Sapindales #{n}" }
        sequence(:family)      { |n| "Aceraceae #{n}" }
        sequence(:genus)       { |n| "Acer L. #{n}" }
        sequence(:species)     { |n| "Acer macrophyllum pursh #{n}" }
    end
end
