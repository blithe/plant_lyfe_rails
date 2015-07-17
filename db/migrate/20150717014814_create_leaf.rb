class CreateLeaf < ActiveRecord::Migration
  def change
    create_table :leafs do |t|
      t.integer :dicot_id
      t.string :placement
      t.string :blade
      t.string :veins
      t.string :location
      t.date :date_found
    end
  end
end
