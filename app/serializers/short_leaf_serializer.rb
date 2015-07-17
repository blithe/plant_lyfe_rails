class ShortLeafSerializer < ActiveModel::Serializer
    attributes :id, :plant

    def id
        "leaf-#{object.id}"
    end

    def plant
        "plant-#{object.dicot.id}"
    end
end
