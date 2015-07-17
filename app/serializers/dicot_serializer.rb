class DicotSerializer < ActiveModel::Serializer
    attributes :id, :common_name, :species

    def id
        "plant-#{object.id}"
    end
end
