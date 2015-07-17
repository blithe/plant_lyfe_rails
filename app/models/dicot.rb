class Dicot < ActiveRecord::Base
    extend FriendlyId
    friendly_id :common_name, use: :slugged

    has_many :leafs, dependent: :destroy
end
