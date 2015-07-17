class LeafSerializer < ActiveModel::Serializer
    attributes :id, :plant, :placement, :blade, :veins, :location, :date_found

    def id
        "leaf-#{object.id}"
    end

    def plant
        "plant-#{object.dicot.id}"
    end
end
