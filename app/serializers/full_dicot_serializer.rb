class FullDicotSerializer < ActiveModel::Serializer
    attributes :id, :common_name, :subclass, :order, :family, :genus, :species

    def id
        "plant-#{object.id}"
    end
end
