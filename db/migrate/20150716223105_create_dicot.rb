class CreateDicot < ActiveRecord::Migration
  def change
    create_table :dicots do |t|
      t.string :common_name
      t.string :subclass
      t.string :order
      t.string :family
      t.string :genus
      t.string :species
    end
  end
end
