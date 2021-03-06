class DicotSerializer < ActiveModel::Serializer
    attributes :id, :common_name, :species, :leaves

    def id
        "plant-#{object.id}"
    end

    def leaves
        object.leafs.collect { |leaf| dicot_leaf_path(object, leaf) }
    end
end
